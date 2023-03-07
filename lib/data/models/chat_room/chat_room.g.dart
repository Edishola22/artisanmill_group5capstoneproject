// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomDto _$$_ChatRoomDtoFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomDto(
      id: json['id'] as String?,
      lastMessage: json['last_message'] as String,
      timestamp: json['timestamp'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      artisan: ArtisanDto.fromJson(json['artisan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatRoomDtoToJson(_$_ChatRoomDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_message': instance.lastMessage,
      'timestamp': instance.timestamp,
      'user': instance.user,
      'artisan': instance.artisan,
    };
