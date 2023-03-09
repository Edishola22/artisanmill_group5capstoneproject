import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';

abstract class UserEvent {}

class CreateUserDocumentEvent extends UserEvent {
  final String name;
  final String? phone;
  final String city;
  final String state;
  final String address;
  final String? email;
  final String? userId;

  CreateUserDocumentEvent({
    required this.name,
    required this.city,
    required this.state,
    required this.address,
    this.phone,
    this.userId,
    this.email,
  });
}

class UpdateUserDocumentEvent extends UserEvent {
  final UserDto user;

  UpdateUserDocumentEvent({required this.user});
}

class FetchUserProfileEvent extends UserEvent {

  FetchUserProfileEvent();
}
