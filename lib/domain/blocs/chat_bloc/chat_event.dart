import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent{
  factory ChatEvent.fetchChatRooms() = _fetchChatRooms;
  factory ChatEvent.fetchConversation(String chatId) = _fetchConversation;
  factory ChatEvent.createChatRoom(String artisanId, ChatMessage message) = _createChatRoom;
  factory ChatEvent.createNewMessage(String chatId, ChatMessage message) = _createNewMessage;
}