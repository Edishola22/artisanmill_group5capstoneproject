import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_user_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/shared_prefs_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<CreateUserDocumentEvent>(onCreateUserDocument);

    on<UpdateUserDocumentEvent>(onUpdateUserDocument);

    on<FetchUserProfileEvent>(onFetchUserProfile);
  }


  final FirebaseUserHelper userHelper = FirebaseUserHelper();
  final AppPreferences appPreferences = AppPreferences();




  void onFetchUserProfile(FetchUserProfileEvent event,
      Emitter<UserState> emit,) async {
    emit(UserState.loading());
    try {
      final userId = await appPreferences.getUserId();
      final DocumentSnapshot<dynamic> userDoc = await userHelper.fetchUserDetails(userId!);
      final user = UserDto.fromJson(userDoc.data());
      emit(UserState.success(user));
    } catch (e) {
      emit(UserState.error('Couldn\'t fetch user details'));
    }
  }

  void onCreateUserDocument(CreateUserDocumentEvent event,
      Emitter<UserState> emit,) async {
    emit(UserState.loading());
    try {
      final userId = await appPreferences.getUserId();
      final userEmail = await appPreferences.getUserEmail();
      final UserDto user = UserDto(
        phoneNumber: event.phone,
        name: event.name,
        city: event.city,
        id: userId,
        email: userEmail,
        state: event.state,
        streetAddress: event.address,
      );
      await userHelper.createUserProfile(user);
      appPreferences.setUserType(UserType.user);
      emit(UserState.success(null));
    } catch (_) {
      emit(UserState.error('Failed to create user details'));
    }
  }

  void onUpdateUserDocument(UpdateUserDocumentEvent event,
      Emitter<UserState> emit,) async {
    emit(UserState.loading());
    try {
      await userHelper.updateUserDetails(event.user);
      emit(UserState.success(null));
    } catch (_) {
      emit(UserState.error('Failed to update user details'));
    }
  }
}
