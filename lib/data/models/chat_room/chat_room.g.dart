// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomDto _$$_ChatRoomDtoFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomDto(
      id: json['id'] as String?,
      userOne: json['user_one'] as String,
      userTwo: json['user_two'] as String,
      userOneName: json['user_one_name'] as String,
      userTwoName: json['user_two_name'] as String,
      userOneImageUrl: json['user_one_image_url'] as String,
      userTwoImageUrl: json['user_two_image_url'] as String,
      lastMessage: json['last_message'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$_ChatRoomDtoToJson(_$_ChatRoomDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_one': instance.userOne,
      'user_two': instance.userTwo,
      'user_one_name': instance.userOneName,
      'user_two_name': instance.userTwoName,
      'user_one_image_url': instance.userOneImageUrl,
      'user_two_image_url': instance.userTwoImageUrl,
      'last_message': instance.lastMessage,
      'timestamp': instance.timestamp,
    };
