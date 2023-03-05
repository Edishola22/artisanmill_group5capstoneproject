import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';
@freezed
class ChatState<T> with _$ChatState {
  factory ChatState.initial() = _initial;
  factory ChatState.loading() = _loading;
  factory ChatState.success(T data) = _success;
  factory ChatState.error(String message) = _error;
}