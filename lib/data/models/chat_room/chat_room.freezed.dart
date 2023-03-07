// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomDto _$ChatRoomDtoFromJson(Map<String, dynamic> json) {
  return _ChatRoomDto.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomDto {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  String get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  String get timestamp => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;
  ArtisanDto get artisan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomDtoCopyWith<ChatRoomDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomDtoCopyWith<$Res> {
  factory $ChatRoomDtoCopyWith(
          ChatRoomDto value, $Res Function(ChatRoomDto) then) =
      _$ChatRoomDtoCopyWithImpl<$Res, ChatRoomDto>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'timestamp') String timestamp,
      UserDto user,
      ArtisanDto artisan});

  $UserDtoCopyWith<$Res> get user;
  $ArtisanDtoCopyWith<$Res> get artisan;
}

/// @nodoc
class _$ChatRoomDtoCopyWithImpl<$Res, $Val extends ChatRoomDto>
    implements $ChatRoomDtoCopyWith<$Res> {
  _$ChatRoomDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lastMessage = null,
    Object? timestamp = null,
    Object? user = null,
    Object? artisan = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      artisan: null == artisan
          ? _value.artisan
          : artisan // ignore: cast_nullable_to_non_nullable
              as ArtisanDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtisanDtoCopyWith<$Res> get artisan {
    return $ArtisanDtoCopyWith<$Res>(_value.artisan, (value) {
      return _then(_value.copyWith(artisan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatRoomDtoCopyWith<$Res>
    implements $ChatRoomDtoCopyWith<$Res> {
  factory _$$_ChatRoomDtoCopyWith(
          _$_ChatRoomDto value, $Res Function(_$_ChatRoomDto) then) =
      __$$_ChatRoomDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'last_message') String lastMessage,
      @JsonKey(name: 'timestamp') String timestamp,
      UserDto user,
      ArtisanDto artisan});

  @override
  $UserDtoCopyWith<$Res> get user;
  @override
  $ArtisanDtoCopyWith<$Res> get artisan;
}

/// @nodoc
class __$$_ChatRoomDtoCopyWithImpl<$Res>
    extends _$ChatRoomDtoCopyWithImpl<$Res, _$_ChatRoomDto>
    implements _$$_ChatRoomDtoCopyWith<$Res> {
  __$$_ChatRoomDtoCopyWithImpl(
      _$_ChatRoomDto _value, $Res Function(_$_ChatRoomDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lastMessage = null,
    Object? timestamp = null,
    Object? user = null,
    Object? artisan = null,
  }) {
    return _then(_$_ChatRoomDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      artisan: null == artisan
          ? _value.artisan
          : artisan // ignore: cast_nullable_to_non_nullable
              as ArtisanDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomDto implements _ChatRoomDto {
  _$_ChatRoomDto(
      {this.id,
      @JsonKey(name: 'last_message') required this.lastMessage,
      @JsonKey(name: 'timestamp') required this.timestamp,
      required this.user,
      required this.artisan});

  factory _$_ChatRoomDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomDtoFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'last_message')
  final String lastMessage;
  @override
  @JsonKey(name: 'timestamp')
  final String timestamp;
  @override
  final UserDto user;
  @override
  final ArtisanDto artisan;

  @override
  String toString() {
    return 'ChatRoomDto(id: $id, lastMessage: $lastMessage, timestamp: $timestamp, user: $user, artisan: $artisan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.artisan, artisan) || other.artisan == artisan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, lastMessage, timestamp, user, artisan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomDtoCopyWith<_$_ChatRoomDto> get copyWith =>
      __$$_ChatRoomDtoCopyWithImpl<_$_ChatRoomDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomDtoToJson(
      this,
    );
  }
}

abstract class _ChatRoomDto implements ChatRoomDto {
  factory _ChatRoomDto(
      {final String? id,
      @JsonKey(name: 'last_message') required final String lastMessage,
      @JsonKey(name: 'timestamp') required final String timestamp,
      required final UserDto user,
      required final ArtisanDto artisan}) = _$_ChatRoomDto;

  factory _ChatRoomDto.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomDto.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'last_message')
  String get lastMessage;
  @override
  @JsonKey(name: 'timestamp')
  String get timestamp;
  @override
  UserDto get user;
  @override
  ArtisanDto get artisan;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomDtoCopyWith<_$_ChatRoomDto> get copyWith =>
      throw _privateConstructorUsedError;
}
