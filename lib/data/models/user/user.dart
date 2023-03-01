
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
    final String? streetAddress,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

}
