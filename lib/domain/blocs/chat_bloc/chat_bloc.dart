import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_artisan_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_chat_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/firebase_user_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/helpers/shared_prefs_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_room/chat_room.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/mappers/chat_room_dto_to_chat_room.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_detail_model.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    on<ChatEvent>(onChatEvents);
  }

  final FirebaseChatHelper chatHelper = FirebaseChatHelper();
  final FirebaseArtisanHelper artisanHelper = FirebaseArtisanHelper();
  final FirebaseUserHelper userHelper = FirebaseUserHelper();
  final AppPreferences appPreferences = AppPreferences();

  void onChatEvents(ChatEvent event, Emitter<ChatState> emit) async {
    await event.when(
      fetchChatRooms: (userId) async => fetchChatRooms(userId, emit),
      fetchConversation: (chatId) async => onFetchConversation(chatId, emit),
      createChatRoom: (artisanId, userId, message) async =>
          createChatRoom(artisanId, userId, message, emit),
      createNewMessage: (chatId, message) async =>
          onCreateNewMessage(chatId, message, emit),
    );
  }

  void onFetchConversation(String chatId, Emitter<ChatState> emit) async {
    try {
      final conversations = chatHelper.fetchConversation(chatId);
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
      await chatHelper.createNewMessage(
          chatId: chatId, message: message.toChatMessageDto());
    } catch (_) {}
  }

  void createChatRoom(
    String artisanId,
    String userId,
    ChatMessage message,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatState.loading());
    try {
      final userDoc = await userHelper.userDoc(userId);
      final user = UserDto.fromJson(userDoc.data() as Map<String, dynamic>);

      dev.log('Chat user is ${user.name}');

      final artisanDoc = await artisanHelper.artisanDoc(userId);
      final artisan =
          ArtisanDto.fromJson(artisanDoc.data() as Map<String, dynamic>);

      dev.log('Chat artisan is ${artisan.businessName}');

      final chatRoom = ChatRoomDto(
        lastMessage: message.message,
        timestamp: message.timeStamp.millisecondsSinceEpoch.toString(),
        user: user,
        artisan: artisan,
      );
      final chatRoomId = await chatHelper.createNewChatRoom(
        chatRoom: chatRoom,
        chatMessage: message.toChatMessageDto(),
      );

      dev.log('chat room created. id is $chatRoomId');

      final conversations = chatHelper.fetchConversation(chatRoomId);

      dev.log('Conversation fetched $conversations');
      final chatDetail =
          ChatDetailModel(chatId: chatRoomId, chatMessages: conversations);
      emit(ChatState.success(chatDetail));
    } catch (e) {
      dev.log(e.toString());
      emit(ChatState.error('Failed to send message'));
    }
  }

  void fetchChatRooms(String userId, Emitter<ChatState> emit) async {
    emit(ChatState.loading());
    try {
      final userType = await appPreferences.getUserType();
      final isArtisan = userType == UserType.artisan;
      final userChatDocs = await chatHelper.fetchUserChatRooms(userId, isArtisan);
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
