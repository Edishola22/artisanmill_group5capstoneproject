import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';

part 'chat_room.g.dart';

@freezed
class ChatRoomDto with _$ChatRoomDto {
  factory ChatRoomDto({
    String? id,
    @JsonKey(name: 'last_message') required String lastMessage,
    @JsonKey(name: 'timestamp') required String timestamp,
    required UserDto user,
    required ArtisanDto artisan,
  }) = _ChatRoomDto;

  factory ChatRoomDto.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDtoFromJson(json);
}
