import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState<T> with _$UserState {
  factory UserState.initial() = _initial;
  factory UserState.loading() = _loading;
  factory UserState.success(T? data) = _success;
  factory UserState.error(String message) = _error;
}