import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState.initial() = _initial;
  factory UserState.loading() = _loading;
  factory UserState.success() = _success;
  factory UserState.error(String message) = _error;
}