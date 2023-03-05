import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';

class ChatModel {
  final String userOneName;
  final String userTwoName;
  final String userOneId;
  final String userTwoId;
  final String recentMessage;
  final DateTime timeStamp;
  final String userOneAvatar;
  final String userTwoAvatar;
  final String? id;

  ChatModel({
    this.id,
    required this.userOneName,
    required this.userTwoName,
    required this.userOneId,
    required this.userTwoId,
    required this.userTwoAvatar,
    required this.recentMessage,
    required this.timeStamp,
    this.userOneAvatar = 'assets/images/chat_avatar.png',
  });

  ChatRoomDto toChatDto() => ChatRoomDto(
        userOne: userOneId,
        userTwo: userTwoId,
        userOneName: userOneName,
        userTwoName: userTwoName,
        userOneImageUrl: userOneAvatar,
        userTwoImageUrl: userTwoAvatar,
        lastMessage: recentMessage,
        timestamp: timeStamp.millisecondsSinceEpoch.toString(),
      );
}
