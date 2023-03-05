import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDetailModel {
  final String chatId;
  final Stream<QuerySnapshot> chatMessages;

  ChatDetailModel({
    required this.chatId,
    required this.chatMessages,
  });
}
