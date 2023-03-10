// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchChatRooms,
    required TResult Function(String chatId) fetchConversation,
    required TResult Function(String artisanId, ChatMessage message)
        createChatRoom,
    required TResult Function(String chatId, ChatMessage message)
        createNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchChatRooms,
    TResult? Function(String chatId)? fetchConversation,
    TResult? Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult? Function(String chatId, ChatMessage message)? createNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchChatRooms,
    TResult Function(String chatId)? fetchConversation,
    TResult Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult Function(String chatId, ChatMessage message)? createNewMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchChatRooms value) fetchChatRooms,
    required TResult Function(_fetchConversation value) fetchConversation,
    required TResult Function(_createChatRoom value) createChatRoom,
    required TResult Function(_createNewMessage value) createNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchChatRooms value)? fetchChatRooms,
    TResult? Function(_fetchConversation value)? fetchConversation,
    TResult? Function(_createChatRoom value)? createChatRoom,
    TResult? Function(_createNewMessage value)? createNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchChatRooms value)? fetchChatRooms,
    TResult Function(_fetchConversation value)? fetchConversation,
    TResult Function(_createChatRoom value)? createChatRoom,
    TResult Function(_createNewMessage value)? createNewMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_fetchChatRoomsCopyWith<$Res> {
  factory _$$_fetchChatRoomsCopyWith(
          _$_fetchChatRooms value, $Res Function(_$_fetchChatRooms) then) =
      __$$_fetchChatRoomsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_fetchChatRoomsCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_fetchChatRooms>
    implements _$$_fetchChatRoomsCopyWith<$Res> {
  __$$_fetchChatRoomsCopyWithImpl(
      _$_fetchChatRooms _value, $Res Function(_$_fetchChatRooms) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_fetchChatRooms implements _fetchChatRooms {
  _$_fetchChatRooms();

  @override
  String toString() {
    return 'ChatEvent.fetchChatRooms()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_fetchChatRooms);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchChatRooms,
    required TResult Function(String chatId) fetchConversation,
    required TResult Function(String artisanId, ChatMessage message)
        createChatRoom,
    required TResult Function(String chatId, ChatMessage message)
        createNewMessage,
  }) {
    return fetchChatRooms();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchChatRooms,
    TResult? Function(String chatId)? fetchConversation,
    TResult? Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult? Function(String chatId, ChatMessage message)? createNewMessage,
  }) {
    return fetchChatRooms?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchChatRooms,
    TResult Function(String chatId)? fetchConversation,
    TResult Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult Function(String chatId, ChatMessage message)? createNewMessage,
    required TResult orElse(),
  }) {
    if (fetchChatRooms != null) {
      return fetchChatRooms();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchChatRooms value) fetchChatRooms,
    required TResult Function(_fetchConversation value) fetchConversation,
    required TResult Function(_createChatRoom value) createChatRoom,
    required TResult Function(_createNewMessage value) createNewMessage,
  }) {
    return fetchChatRooms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchChatRooms value)? fetchChatRooms,
    TResult? Function(_fetchConversation value)? fetchConversation,
    TResult? Function(_createChatRoom value)? createChatRoom,
    TResult? Function(_createNewMessage value)? createNewMessage,
  }) {
    return fetchChatRooms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchChatRooms value)? fetchChatRooms,
    TResult Function(_fetchConversation value)? fetchConversation,
    TResult Function(_createChatRoom value)? createChatRoom,
    TResult Function(_createNewMessage value)? createNewMessage,
    required TResult orElse(),
  }) {
    if (fetchChatRooms != null) {
      return fetchChatRooms(this);
    }
    return orElse();
  }
}

abstract class _fetchChatRooms implements ChatEvent {
  factory _fetchChatRooms() = _$_fetchChatRooms;
}

/// @nodoc
abstract class _$$_fetchConversationCopyWith<$Res> {
  factory _$$_fetchConversationCopyWith(_$_fetchConversation value,
          $Res Function(_$_fetchConversation) then) =
      __$$_fetchConversationCopyWithImpl<$Res>;
  @useResult
  $Res call({String chatId});
}

/// @nodoc
class __$$_fetchConversationCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_fetchConversation>
    implements _$$_fetchConversationCopyWith<$Res> {
  __$$_fetchConversationCopyWithImpl(
      _$_fetchConversation _value, $Res Function(_$_fetchConversation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
  }) {
    return _then(_$_fetchConversation(
      null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_fetchConversation implements _fetchConversation {
  _$_fetchConversation(this.chatId);

  @override
  final String chatId;

  @override
  String toString() {
    return 'ChatEvent.fetchConversation(chatId: $chatId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetchConversation &&
            (identical(other.chatId, chatId) || other.chatId == chatId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_fetchConversationCopyWith<_$_fetchConversation> get copyWith =>
      __$$_fetchConversationCopyWithImpl<_$_fetchConversation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchChatRooms,
    required TResult Function(String chatId) fetchConversation,
    required TResult Function(String artisanId, ChatMessage message)
        createChatRoom,
    required TResult Function(String chatId, ChatMessage message)
        createNewMessage,
  }) {
    return fetchConversation(chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchChatRooms,
    TResult? Function(String chatId)? fetchConversation,
    TResult? Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult? Function(String chatId, ChatMessage message)? createNewMessage,
  }) {
    return fetchConversation?.call(chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchChatRooms,
    TResult Function(String chatId)? fetchConversation,
    TResult Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult Function(String chatId, ChatMessage message)? createNewMessage,
    required TResult orElse(),
  }) {
    if (fetchConversation != null) {
      return fetchConversation(chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchChatRooms value) fetchChatRooms,
    required TResult Function(_fetchConversation value) fetchConversation,
    required TResult Function(_createChatRoom value) createChatRoom,
    required TResult Function(_createNewMessage value) createNewMessage,
  }) {
    return fetchConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchChatRooms value)? fetchChatRooms,
    TResult? Function(_fetchConversation value)? fetchConversation,
    TResult? Function(_createChatRoom value)? createChatRoom,
    TResult? Function(_createNewMessage value)? createNewMessage,
  }) {
    return fetchConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchChatRooms value)? fetchChatRooms,
    TResult Function(_fetchConversation value)? fetchConversation,
    TResult Function(_createChatRoom value)? createChatRoom,
    TResult Function(_createNewMessage value)? createNewMessage,
    required TResult orElse(),
  }) {
    if (fetchConversation != null) {
      return fetchConversation(this);
    }
    return orElse();
  }
}

abstract class _fetchConversation implements ChatEvent {
  factory _fetchConversation(final String chatId) = _$_fetchConversation;

  String get chatId;
  @JsonKey(ignore: true)
  _$$_fetchConversationCopyWith<_$_fetchConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_createChatRoomCopyWith<$Res> {
  factory _$$_createChatRoomCopyWith(
          _$_createChatRoom value, $Res Function(_$_createChatRoom) then) =
      __$$_createChatRoomCopyWithImpl<$Res>;
  @useResult
  $Res call({String artisanId, ChatMessage message});
}

/// @nodoc
class __$$_createChatRoomCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_createChatRoom>
    implements _$$_createChatRoomCopyWith<$Res> {
  __$$_createChatRoomCopyWithImpl(
      _$_createChatRoom _value, $Res Function(_$_createChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artisanId = null,
    Object? message = null,
  }) {
    return _then(_$_createChatRoom(
      null == artisanId
          ? _value.artisanId
          : artisanId // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
    ));
  }
}

/// @nodoc

class _$_createChatRoom implements _createChatRoom {
  _$_createChatRoom(this.artisanId, this.message);

  @override
  final String artisanId;
  @override
  final ChatMessage message;

  @override
  String toString() {
    return 'ChatEvent.createChatRoom(artisanId: $artisanId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_createChatRoom &&
            (identical(other.artisanId, artisanId) ||
                other.artisanId == artisanId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, artisanId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_createChatRoomCopyWith<_$_createChatRoom> get copyWith =>
      __$$_createChatRoomCopyWithImpl<_$_createChatRoom>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchChatRooms,
    required TResult Function(String chatId) fetchConversation,
    required TResult Function(String artisanId, ChatMessage message)
        createChatRoom,
    required TResult Function(String chatId, ChatMessage message)
        createNewMessage,
  }) {
    return createChatRoom(artisanId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchChatRooms,
    TResult? Function(String chatId)? fetchConversation,
    TResult? Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult? Function(String chatId, ChatMessage message)? createNewMessage,
  }) {
    return createChatRoom?.call(artisanId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchChatRooms,
    TResult Function(String chatId)? fetchConversation,
    TResult Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult Function(String chatId, ChatMessage message)? createNewMessage,
    required TResult orElse(),
  }) {
    if (createChatRoom != null) {
      return createChatRoom(artisanId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchChatRooms value) fetchChatRooms,
    required TResult Function(_fetchConversation value) fetchConversation,
    required TResult Function(_createChatRoom value) createChatRoom,
    required TResult Function(_createNewMessage value) createNewMessage,
  }) {
    return createChatRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchChatRooms value)? fetchChatRooms,
    TResult? Function(_fetchConversation value)? fetchConversation,
    TResult? Function(_createChatRoom value)? createChatRoom,
    TResult? Function(_createNewMessage value)? createNewMessage,
  }) {
    return createChatRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchChatRooms value)? fetchChatRooms,
    TResult Function(_fetchConversation value)? fetchConversation,
    TResult Function(_createChatRoom value)? createChatRoom,
    TResult Function(_createNewMessage value)? createNewMessage,
    required TResult orElse(),
  }) {
    if (createChatRoom != null) {
      return createChatRoom(this);
    }
    return orElse();
  }
}

abstract class _createChatRoom implements ChatEvent {
  factory _createChatRoom(final String artisanId, final ChatMessage message) =
      _$_createChatRoom;

  String get artisanId;
  ChatMessage get message;
  @JsonKey(ignore: true)
  _$$_createChatRoomCopyWith<_$_createChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_createNewMessageCopyWith<$Res> {
  factory _$$_createNewMessageCopyWith(
          _$_createNewMessage value, $Res Function(_$_createNewMessage) then) =
      __$$_createNewMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({String chatId, ChatMessage message});
}

/// @nodoc
class __$$_createNewMessageCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$_createNewMessage>
    implements _$$_createNewMessageCopyWith<$Res> {
  __$$_createNewMessageCopyWithImpl(
      _$_createNewMessage _value, $Res Function(_$_createNewMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? message = null,
  }) {
    return _then(_$_createNewMessage(
      null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
    ));
  }
}

/// @nodoc

class _$_createNewMessage implements _createNewMessage {
  _$_createNewMessage(this.chatId, this.message);

  @override
  final String chatId;
  @override
  final ChatMessage message;

  @override
  String toString() {
    return 'ChatEvent.createNewMessage(chatId: $chatId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_createNewMessage &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_createNewMessageCopyWith<_$_createNewMessage> get copyWith =>
      __$$_createNewMessageCopyWithImpl<_$_createNewMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchChatRooms,
    required TResult Function(String chatId) fetchConversation,
    required TResult Function(String artisanId, ChatMessage message)
        createChatRoom,
    required TResult Function(String chatId, ChatMessage message)
        createNewMessage,
  }) {
    return createNewMessage(chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchChatRooms,
    TResult? Function(String chatId)? fetchConversation,
    TResult? Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult? Function(String chatId, ChatMessage message)? createNewMessage,
  }) {
    return createNewMessage?.call(chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchChatRooms,
    TResult Function(String chatId)? fetchConversation,
    TResult Function(String artisanId, ChatMessage message)? createChatRoom,
    TResult Function(String chatId, ChatMessage message)? createNewMessage,
    required TResult orElse(),
  }) {
    if (createNewMessage != null) {
      return createNewMessage(chatId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchChatRooms value) fetchChatRooms,
    required TResult Function(_fetchConversation value) fetchConversation,
    required TResult Function(_createChatRoom value) createChatRoom,
    required TResult Function(_createNewMessage value) createNewMessage,
  }) {
    return createNewMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchChatRooms value)? fetchChatRooms,
    TResult? Function(_fetchConversation value)? fetchConversation,
    TResult? Function(_createChatRoom value)? createChatRoom,
    TResult? Function(_createNewMessage value)? createNewMessage,
  }) {
    return createNewMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchChatRooms value)? fetchChatRooms,
    TResult Function(_fetchConversation value)? fetchConversation,
    TResult Function(_createChatRoom value)? createChatRoom,
    TResult Function(_createNewMessage value)? createNewMessage,
    required TResult orElse(),
  }) {
    if (createNewMessage != null) {
      return createNewMessage(this);
    }
    return orElse();
  }
}

abstract class _createNewMessage implements ChatEvent {
  factory _createNewMessage(final String chatId, final ChatMessage message) =
      _$_createNewMessage;

  String get chatId;
  ChatMessage get message;
  @JsonKey(ignore: true)
  _$$_createNewMessageCopyWith<_$_createNewMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
