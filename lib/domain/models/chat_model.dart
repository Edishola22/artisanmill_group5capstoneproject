import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';

class ChatModel {
  final UserDto user;
  final ArtisanDto artisan;
  final String recentMessage;
  final DateTime timeStamp;
  final String? id;

  ChatModel({
    this.id,
    required this.user,
    required this.artisan,
    required this.recentMessage,
    required this.timeStamp,
  });

  ChatRoomDto toChatDto() => ChatRoomDto(
        user: user,
        artisan: artisan,
        lastMessage: recentMessage,
        timestamp: timeStamp.millisecondsSinceEpoch.toString(),
      );
}
