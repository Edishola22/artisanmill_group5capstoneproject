import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';

part 'chat_room.g.dart';

@freezed
class ChatRoomDto with _$ChatRoomDto {
  factory ChatRoomDto({
    String? id,
    @JsonKey(name: 'user_one') required String userOne,
    @JsonKey(name: 'user_two') required String userTwo,
    @JsonKey(name: 'user_one_name') required String userOneName,
    @JsonKey(name: 'user_two_name') required String userTwoName,
    @JsonKey(name: 'user_one_image_url') required String userOneImageUrl,
    @JsonKey(name: 'user_two_image_url') required String userTwoImageUrl,
    @JsonKey(name: 'last_message') required String lastMessage,
    @JsonKey(name: 'timestamp') required String timestamp,
  }) = _ChatRoomDto;

  factory ChatRoomDto.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDtoFromJson(json);
}
