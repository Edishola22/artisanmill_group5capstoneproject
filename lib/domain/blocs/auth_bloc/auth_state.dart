import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState.initial() = _initial;
  factory AuthState.loading() = _loading;
  factory AuthState.authenticatedUser() = _authenticatedUser;
  factory AuthState.authenticatedUnknown() = _authenticatedUnknown;
  factory AuthState.authenticatedArtisan() = _authenticatedArtisan;
  factory AuthState.unauthenticated() = _unauthenticated;
  factory AuthState.error(String message) = _error;
}