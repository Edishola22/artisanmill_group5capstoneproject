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

  Future<List<QueryDocumentSnapshot>> fetchUserChatRooms(String userId, bool isArtisan) async {
    QuerySnapshot result;
    if(isArtisan) {
     result = await chatRoomsRef.where('artisan.id', isEqualTo: userId).get();
    } else {
     result =  await chatRoomsRef.where('user.id', isEqualTo: userId).get();
    }

    return result.docs;
  }

  Future<void> createNewMessage({
    required String chatId,
    required ChatMessageDto message,
  }) async {
    await chatRoomsRef.doc(chatId).collection('messages').add(message.toJson());
    await chatRoomsRef.doc(chatId).update({
      'last_message': message.message,
      'timestamp': message.timeStamp,
    });
  }

  Future<String> createNewChatRoom({
    required ChatRoomDto chatRoom,
    required ChatMessageDto chatMessage,
  }) async {
    final chatRoomMap = chatRoom.toJson();
    chatRoomMap['artisan'] = chatRoom.artisan.toJson();
    chatRoomMap['user'] = chatRoom.user.toJson();
    final docRef = await chatRoomsRef.add(chatRoomMap);
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
