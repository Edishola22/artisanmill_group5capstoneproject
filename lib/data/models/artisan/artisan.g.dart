// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artisan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArtisanDto _$$_ArtisanDtoFromJson(Map<String, dynamic> json) =>
    _$_ArtisanDto(
      id: json['id'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      businessName: json['businessName'] as String?,
      occupation: json['occupation'] as String?,
      businessDescription: json['businessDescription'] as String?,
      state: json['state'] as String?,
      category: json['category'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_ArtisanDtoToJson(_$_ArtisanDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'businessName': instance.businessName,
      'occupation': instance.occupation,
      'businessDescription': instance.businessDescription,
      'state': instance.state,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };
