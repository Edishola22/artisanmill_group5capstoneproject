import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';
@freezed
class ChatMessageDto with _$ChatMessageDto{

  factory ChatMessageDto({
    required String message,
    required String senderId,
    @JsonKey(name: 'timestamp') required String timeStamp,
  }) = _ChatMessage;

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
  _$ChatMessageDtoFromJson(json);

}