// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserNavState {
  int get index => throw _privateConstructorUsedError;
  ArtisanDto? get artisan => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserNavStateCopyWith<UserNavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNavStateCopyWith<$Res> {
  factory $UserNavStateCopyWith(
          UserNavState value, $Res Function(UserNavState) then) =
      _$UserNavStateCopyWithImpl<$Res, UserNavState>;
  @useResult
  $Res call({int index, ArtisanDto? artisan, String? location});

  $ArtisanDtoCopyWith<$Res>? get artisan;
}

/// @nodoc
class _$UserNavStateCopyWithImpl<$Res, $Val extends UserNavState>
    implements $UserNavStateCopyWith<$Res> {
  _$UserNavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? artisan = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      artisan: freezed == artisan
          ? _value.artisan
          : artisan // ignore: cast_nullable_to_non_nullable
              as ArtisanDto?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtisanDtoCopyWith<$Res>? get artisan {
    if (_value.artisan == null) {
      return null;
    }

    return $ArtisanDtoCopyWith<$Res>(_value.artisan!, (value) {
      return _then(_value.copyWith(artisan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserNavStateCopyWith<$Res>
    implements $UserNavStateCopyWith<$Res> {
  factory _$$_UserNavStateCopyWith(
          _$_UserNavState value, $Res Function(_$_UserNavState) then) =
      __$$_UserNavStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, ArtisanDto? artisan, String? location});

  @override
  $ArtisanDtoCopyWith<$Res>? get artisan;
}

/// @nodoc
class __$$_UserNavStateCopyWithImpl<$Res>
    extends _$UserNavStateCopyWithImpl<$Res, _$_UserNavState>
    implements _$$_UserNavStateCopyWith<$Res> {
  __$$_UserNavStateCopyWithImpl(
      _$_UserNavState _value, $Res Function(_$_UserNavState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? artisan = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_UserNavState(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      artisan: freezed == artisan
          ? _value.artisan
          : artisan // ignore: cast_nullable_to_non_nullable
              as ArtisanDto?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserNavState implements _UserNavState {
  _$_UserNavState({required this.index, this.artisan, this.location});

  @override
  final int index;
  @override
  final ArtisanDto? artisan;
  @override
  final String? location;

  @override
  String toString() {
    return 'UserNavState(index: $index, artisan: $artisan, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserNavState &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.artisan, artisan) || other.artisan == artisan) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, artisan, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserNavStateCopyWith<_$_UserNavState> get copyWith =>
      __$$_UserNavStateCopyWithImpl<_$_UserNavState>(this, _$identity);
}

abstract class _UserNavState implements UserNavState {
  factory _UserNavState(
      {required final int index,
      final ArtisanDto? artisan,
      final String? location}) = _$_UserNavState;

  @override
  int get index;
  @override
  ArtisanDto? get artisan;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$_UserNavStateCopyWith<_$_UserNavState> get copyWith =>
      throw _privateConstructorUsedError;
}
