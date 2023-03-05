// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      message: json['message'] as String,
      senderId: json['senderId'] as String,
      timeStamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'senderId': instance.senderId,
      'timestamp': instance.timeStamp,
    };
