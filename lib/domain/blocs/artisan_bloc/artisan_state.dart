import 'package:freezed_annotation/freezed_annotation.dart';

part 'artisan_state.freezed.dart';

@freezed
abstract class ArtisanState<T> with _$ArtisanState {
  factory ArtisanState.uninitiated() = _uninitiated;
  factory ArtisanState.loading() = _loading;
  factory ArtisanState.success(T? data) = _success;
  factory ArtisanState.error(String message) = _error;
}