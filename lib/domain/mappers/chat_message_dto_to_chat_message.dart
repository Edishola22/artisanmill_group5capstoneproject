import 'package:artisanmill_group5capstoneproject/data/models/chat_message/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';

extension ChatMessageDtoMapper on ChatMessageDto {

  ChatMessage toChatMessage() {
    return ChatMessage(
      message: message,
      sender: senderId,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(int.parse(timeStamp)),
    );
  }
}