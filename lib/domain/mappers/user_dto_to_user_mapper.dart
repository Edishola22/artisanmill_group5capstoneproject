import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/user.dart';

extension UserDtoMapper on UserDto {

  User toUserDto() {
    return User(
      id: id,
      name: name,
      email: email,
      city: city,
      phoneNumber: phoneNumber,
      imageUrl: imageUrl,
      state: state,
      streetAddress: streetAddress,
    );
  }
}