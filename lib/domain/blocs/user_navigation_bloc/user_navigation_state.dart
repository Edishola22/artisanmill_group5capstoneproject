import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_navigation_state.freezed.dart';

@freezed
class UserNavState with _$UserNavState {
  factory UserNavState({
    required int index,
    ArtisanDto? artisan,
    String? location,
  }) = _UserNavState;
}
