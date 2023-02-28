import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';

class ChatModel {
  final String name;
  final String recentMessage;
  final DateTime timeStamp;
  final String userAvatar;

  ChatModel({
    required this.name,
    required this.recentMessage,
    required this.timeStamp,
    this.userAvatar = 'assets/images/chat_avatar.png',
  });
}
