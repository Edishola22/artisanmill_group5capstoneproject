
import 'package:artisanmill_group5capstoneproject/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class UserDto with _$UserDto {

  factory UserDto({
    final String? id,
     final String? email,
     final String? phoneNumber,
     final String? name,
     final String? city,
     final String? state,
    final String? streetAddress,
    final String? imageUrl,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);



}
