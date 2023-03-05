import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_chat_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/mappers/chat_room_dto_to_chat_room.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_detail_model.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';
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
      fetchConversation: (chatId) async => onFetchConversation(chatId, emit),
      createChatRoom: (chat, message) async =>
          createChatRoom(chat, message, emit),
      createNewMessage: (chatId, message) async =>
          onCreateNewMessage(chatId, message, emit),
    );
  }

  void onFetchConversation(String chatId, Emitter<ChatState> emit) async {
    try {
      final conversations = helper.fetchConversation(chatId);
      final chatDetail =
          ChatDetailModel(chatId: chatId, chatMessages: conversations);
      emit(ChatState.success(chatDetail));
    } catch (_) {}
  }

  void onCreateNewMessage(
    String chatId,
    ChatMessage message,
    Emitter<ChatState> emit,
  ) async {
    try {
      await helper.createNewMessage(
          chatId: chatId, message: message.toChatMessageDto());
    } catch (_) {}
  }

  void createChatRoom(
    ChatModel chat,
    ChatMessage message,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatState.loading());
    try {
      final chatRoomId = await helper.createNewChatRoom(
        chatRoom: chat.toChatDto(),
        chatMessage: message.toChatMessageDto(),
      );

      final conversations = helper.fetchConversation(chatRoomId);
      final chatDetail =
          ChatDetailModel(chatId: chatRoomId, chatMessages: conversations);
      emit(ChatState.success(chatDetail));
    } catch (_) {
      emit(ChatState.error('Failed to send message'));
    }
  }

  void fetchChatRooms(String userId, Emitter<ChatState> emit) async {
    emit(ChatState.loading());
    try {
      final userChatDocs = await helper.fetchUserChatRooms(userId);
      final userChats = userChatDocs.map((dynamic chatDoc) {
        var chatRoomDto = ChatRoomDto.fromJson(chatDoc.data());
        chatRoomDto = chatRoomDto.copyWith(
          id: chatDoc.id,
        );
        final chat = chatRoomDto.toChatRoom();

        return chat;
      }).toList();
      dev.log('Chat rooms are' + userChats.toString());

      emit(ChatState.success(userChats));
    } catch (e) {
      emit(ChatState.error('Error occurred while fetching chats'));
    }
  }
}
