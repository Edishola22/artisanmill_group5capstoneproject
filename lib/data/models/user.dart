
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class UserDto with _$UserDto {

  factory UserDto({
    final String? id,
    required final String email,
    required final String phoneNumber,
    required final String name,
    required final String city,
    required final String streetAddress,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

}
