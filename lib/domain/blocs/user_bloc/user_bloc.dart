import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_user_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_state.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<CreateUserDocumentEvent>(onCreateUserDocument);

    on<UpdateUserDocumentEvent>(onUpdateUserDocument);
  }




  final FirebaseUserHelper userHelper = FirebaseUserHelper();

  String get userId => userHelper.userId;

  void onCreateUserDocument(
    CreateUserDocumentEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading());
    try {
      final UserDto user = UserDto(
        phoneNumber: event.phone,
        name: event.name,
        city: event.city,
        state: event.state,
        streetAddress: event.address,
      );
      await userHelper.createUserProfile(user);
      emit(UserState.success());
    } catch (_) {
      emit(UserState.error('Failed to create user details'));
    }
  }

  void onUpdateUserDocument(
    UpdateUserDocumentEvent event,
    Emitter<UserState> emit,
  ) {}
}
