import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_chat_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/mappers/chat_room_dto_to_chat_room.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    on<ChatEvent>(onChatEvents);
  }

  final FirebaseChatHelper helper = FirebaseChatHelper();

  void onChatEvents(ChatEvent event, Emitter<ChatState> emit) async {
    await event.when(
      fetchChatRooms: (userId) async => fetchChatRooms(userId, emit),
     fetchConversation: (chatId) {

     },
      createChatRoom: (chat, message) {

      },
    );
  }

  void fetchChatRooms(String userId, Emitter<ChatState> emit) async {
    emit(ChatState.loading());
    try {
      final userChatDocs = await helper.fetchUserChatRooms(userId);
      final userChats = userChatDocs.docs.map((dynamic chatDoc) {
        final chatRoomDto = ChatRoomDto.fromJson(chatDoc.data());
        final chat = chatRoomDto.toChatRoom();

        return chat;

      }).toList();

     emit(ChatState.success(userChats));

    }
    catch(e) {
      emit(ChatState.error('Error occurred while fetching chats'));
    }
  }
}
