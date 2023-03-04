import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';

abstract class UserEvent {}

class CreateUserDocumentEvent extends UserEvent {
  final String name;
  final String? phone;
  final String city;
  final String state;
  final String address;

  CreateUserDocumentEvent({
    required this.name,
    required this.city,
    required this.state,
    required this.address,
    this.phone,
  });
}

class UpdateUserDocumentEvent extends UserEvent {
  final UserDto user;

  UpdateUserDocumentEvent({required this.user});
}
