// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      streetAddress: json['streetAddress'] as String?,
      imageUrl: json['imageUrl'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'city': instance.city,
      'state': instance.state,
      'streetAddress': instance.streetAddress,
      'imageUrl': instance.imageUrl,
      'country': instance.country,
    };
