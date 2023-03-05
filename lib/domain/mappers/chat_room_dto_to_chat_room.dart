import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';

extension ChatRoomDtoMapper on ChatRoomDto {

  ChatModel toChatRoom() {
    return ChatModel(
      userOneName: userOneName,
      userTwoName: userTwoName,
      recentMessage: lastMessage,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(int.tryParse(timestamp) ?? 0),
      userOneAvatar: userOneImageUrl,
      userTwoAvatar: userTwoImageUrl,
    );
  }
}