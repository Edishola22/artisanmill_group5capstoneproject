import 'package:artisanmill_group5capstoneproject/data/models/chat_message/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as dev;

class FirebaseChatHelper {
  static final FirebaseChatHelper _shared =
      FirebaseChatHelper._sharedInstance();

  FirebaseChatHelper._sharedInstance();

  factory FirebaseChatHelper() => _shared;

  final chatRoomsRef = FirebaseFirestore.instance.collection('chat_rooms');

  Future<List<QueryDocumentSnapshot>> fetchUserChatRooms(String userId) async {
    final resultOne =
        await chatRoomsRef.where('user_one', isEqualTo: userId).get();
    final resultTwo =
        await chatRoomsRef.where('user_two', isEqualTo: userId).get();
    return [
      ...resultOne.docs,
      ...resultTwo.docs,
    ];
  }

  Future<void> createNewMessage({
    required String chatId,
    required ChatMessageDto message,
  }) async {
    await chatRoomsRef.doc(chatId).collection('messages').add(message.toJson());
  }

  Future<String> createNewChatRoom({
    required ChatRoomDto chatRoom,
    required ChatMessageDto chatMessage,
  }) async {
    final docRef = await chatRoomsRef.add(chatRoom.toJson());
    await chatRoomsRef
        .doc(docRef.id)
        .collection('messages')
        .add(chatMessage.toJson());
    return docRef.id;
  }

  Stream<QuerySnapshot> fetchConversation(String chatId) {
    return chatRoomsRef
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots();
  }
}
