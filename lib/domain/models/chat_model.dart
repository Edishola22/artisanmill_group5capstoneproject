import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';

class ChatModel {
  final String userOneName;
  final String userTwoName;
  final String recentMessage;
  final DateTime timeStamp;
  final String userOneAvatar;
  final String userTwoAvatar;

  ChatModel({
    required this.userOneName,
    required this.userTwoName,
    required this.userTwoAvatar,
    required this.recentMessage,
    required this.timeStamp,
    this.userOneAvatar = 'assets/images/chat_avatar.png',
  });
}
