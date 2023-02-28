import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_auth_helper.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/utils/exceptions/auth_exceptions.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthHelper authHelper = FirebaseAuthHelper();

  AuthBloc() : super(AuthState.uninitiated()) {
    on<CreateAccountWithEmailAndPasswordEvent>(_createAccount);

    on<GoogleSignInEvent>(_initiateGoogleSignIn);
  }

  void _initiateGoogleSignIn(GoogleSignInEvent event, Emitter<AuthState> emit,) async {
    emit(AuthState.loading());
    try {
      await authHelper.signInWithGoogle();
      emit(AuthState.success());
    }
    catch (_) {
      emit(AuthState.error('Error occurred while signing in'));
    }

  }

  void _createAccount(CreateAccountWithEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());

    try {
      await authHelper.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthState.success());
    } on WeakPassWordException {
      emit(
        AuthState.error(
            'Weak password. Password should be at least 6 characters'),
      );
    }
    on EmailAlreadyInUseException {
      emit(
        AuthState.error(
            'User already exists'),
      );
    }
    on GenericAuthException {
      emit(
        AuthState.error(
            'Error occurred while creating account'),
      );
    }
  }
}
