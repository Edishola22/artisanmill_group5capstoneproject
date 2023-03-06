import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_auth_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_user_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/shared_prefs_helper.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/auth_exceptions.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthHelper authHelper = FirebaseAuthHelper();
  //final FirebaseUserHelper userHelper = FirebaseUserHelper();
  final AppPreferences preferences = AppPreferences();

  AuthBloc() : super(AuthState.initial()) {
    on<CreateAccountWithEmailAndPasswordEvent>(_createAccount);

    on<GoogleSignInEvent>(_initiateGoogleSignIn);

    on<CheckAuthStatusEvent>(onCheckAuthStatus);

    on<LogoutAuthEvent>(onLogOutEvent);

    on<LoginAuthEvent>(onLoginWithEmailAndPassword);
  }

  void onLoginWithEmailAndPassword(LoginAuthEvent event,
      Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    try {
      final user = await authHelper.loginWithEmailAndPassword(
        email: event.email, password: event.password,);

      dev.log('login userId is ${user?.uid}');

      await preferences.setIsLoggedIn();
      await preferences.setUserId(user!.uid);
      emit(AuthState.authenticated());
    }
    on UserNotFoundException {
      emit(
        AuthState.error(
            'User does not exist'),
      );
    } on WrongPasswordException {
      emit(
        AuthState.error('Incorrect email or password'),
      );
    } on GenericAuthException {
      emit(
        AuthState.error('Error occurred while creating account'),
      );
    }
  }


  void onLogOutEvent(LogoutAuthEvent event, Emitter<AuthState> emit) async  {
    await authHelper.logoutUser();
    await preferences.clearData();
    emit(AuthState.unauthenticated());
  }

  void onCheckAuthStatus(CheckAuthStatusEvent event,
      Emitter<AuthState> emit,) async {
    final isLoggedIn = await preferences.isLoggedIn();
    if (isLoggedIn) {
      emit(AuthState.authenticated());
    } else {
      emit(AuthState.unauthenticated());
    }
  }

  void _initiateGoogleSignIn(GoogleSignInEvent event,
      Emitter<AuthState> emit,) async {
    emit(AuthState.loading());
    try {
      final user = await authHelper.signInWithGoogle();
      await preferences.setIsLoggedIn();
      await preferences.setUserId(user!.uid);
      emit(AuthState.authenticated());
    } catch (_) {
      emit(AuthState.error('Error occurred while signing in'));
    }
  }

  void _createAccount(CreateAccountWithEmailAndPasswordEvent event,
      Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    try {
      final user = await authHelper.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      await preferences.setIsLoggedIn();
      await preferences.setUserId(user!.uid);

      emit(AuthState.authenticated());
    } on WeakPassWordException {
      emit(
        AuthState.error(
            'Weak password. Password should be at least 6 characters'),
      );
    } on EmailAlreadyInUseException {
      emit(
        AuthState.error('User already exists'),
      );
    } on GenericAuthException {
      emit(
        AuthState.error('Error occurred while creating account'),
      );
    }
  }
}
