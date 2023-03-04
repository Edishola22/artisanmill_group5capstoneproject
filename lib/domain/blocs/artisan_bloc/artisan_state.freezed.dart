// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artisan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArtisanState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitiated,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitiated,
    TResult? Function()? loading,
    TResult? Function(T? data)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitiated,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uninitiated<T> value) uninitiated,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uninitiated<T> value)? uninitiated,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_success<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uninitiated<T> value)? uninitiated,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtisanStateCopyWith<T, $Res> {
  factory $ArtisanStateCopyWith(
          ArtisanState<T> value, $Res Function(ArtisanState<T>) then) =
      _$ArtisanStateCopyWithImpl<T, $Res, ArtisanState<T>>;
}

/// @nodoc
class _$ArtisanStateCopyWithImpl<T, $Res, $Val extends ArtisanState<T>>
    implements $ArtisanStateCopyWith<T, $Res> {
  _$ArtisanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_uninitiatedCopyWith<T, $Res> {
  factory _$$_uninitiatedCopyWith(
          _$_uninitiated<T> value, $Res Function(_$_uninitiated<T>) then) =
      __$$_uninitiatedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_uninitiatedCopyWithImpl<T, $Res>
    extends _$ArtisanStateCopyWithImpl<T, $Res, _$_uninitiated<T>>
    implements _$$_uninitiatedCopyWith<T, $Res> {
  __$$_uninitiatedCopyWithImpl(
      _$_uninitiated<T> _value, $Res Function(_$_uninitiated<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_uninitiated<T> implements _uninitiated<T> {
  _$_uninitiated();

  @override
  String toString() {
    return 'ArtisanState<$T>.uninitiated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_uninitiated<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitiated,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String message) error,
  }) {
    return uninitiated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitiated,
    TResult? Function()? loading,
    TResult? Function(T? data)? success,
    TResult? Function(String message)? error,
  }) {
    return uninitiated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitiated,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (uninitiated != null) {
      return uninitiated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uninitiated<T> value) uninitiated,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return uninitiated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uninitiated<T> value)? uninitiated,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_success<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return uninitiated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uninitiated<T> value)? uninitiated,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (uninitiated != null) {
      return uninitiated(this);
    }
    return orElse();
  }
}

abstract class _uninitiated<T> implements ArtisanState<T> {
  factory _uninitiated() = _$_uninitiated<T>;
}

/// @nodoc
abstract class _$$_loadingCopyWith<T, $Res> {
  factory _$$_loadingCopyWith(
          _$_loading<T> value, $Res Function(_$_loading<T>) then) =
      __$$_loadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_loadingCopyWithImpl<T, $Res>
    extends _$ArtisanStateCopyWithImpl<T, $Res, _$_loading<T>>
    implements _$$_loadingCopyWith<T, $Res> {
  __$$_loadingCopyWithImpl(
      _$_loading<T> _value, $Res Function(_$_loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loading<T> implements _loading<T> {
  _$_loading();

  @override
  String toString() {
    return 'ArtisanState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitiated,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitiated,
    TResult? Function()? loading,
    TResult? Function(T? data)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitiated,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uninitiated<T> value) uninitiated,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uninitiated<T> value)? uninitiated,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_success<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uninitiated<T> value)? uninitiated,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading<T> implements ArtisanState<T> {
  factory _loading() = _$_loading<T>;
}

/// @nodoc
abstract class _$$_successCopyWith<T, $Res> {
  factory _$$_successCopyWith(
          _$_success<T> value, $Res Function(_$_success<T>) then) =
      __$$_successCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$_successCopyWithImpl<T, $Res>
    extends _$ArtisanStateCopyWithImpl<T, $Res, _$_success<T>>
    implements _$$_successCopyWith<T, $Res> {
  __$$_successCopyWithImpl(
      _$_success<T> _value, $Res Function(_$_success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_success<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_success<T> implements _success<T> {
  _$_success(this.data);

  @override
  final T? data;

  @override
  String toString() {
    return 'ArtisanState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_successCopyWith<T, _$_success<T>> get copyWith =>
      __$$_successCopyWithImpl<T, _$_success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitiated,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitiated,
    TResult? Function()? loading,
    TResult? Function(T? data)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitiated,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uninitiated<T> value) uninitiated,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uninitiated<T> value)? uninitiated,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_success<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uninitiated<T> value)? uninitiated,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _success<T> implements ArtisanState<T> {
  factory _success(final T? data) = _$_success<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$_successCopyWith<T, _$_success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_errorCopyWith<T, $Res> {
  factory _$$_errorCopyWith(
          _$_error<T> value, $Res Function(_$_error<T>) then) =
      __$$_errorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_errorCopyWithImpl<T, $Res>
    extends _$ArtisanStateCopyWithImpl<T, $Res, _$_error<T>>
    implements _$$_errorCopyWith<T, $Res> {
  __$$_errorCopyWithImpl(_$_error<T> _value, $Res Function(_$_error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_error<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_error<T> implements _error<T> {
  _$_error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ArtisanState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_error<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_errorCopyWith<T, _$_error<T>> get copyWith =>
      __$$_errorCopyWithImpl<T, _$_error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitiated,
    required TResult Function() loading,
    required TResult Function(T? data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitiated,
    TResult? Function()? loading,
    TResult? Function(T? data)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitiated,
    TResult Function()? loading,
    TResult Function(T? data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_uninitiated<T> value) uninitiated,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_uninitiated<T> value)? uninitiated,
    TResult? Function(_loading<T> value)? loading,
    TResult? Function(_success<T> value)? success,
    TResult? Function(_error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_uninitiated<T> value)? uninitiated,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error<T> implements ArtisanState<T> {
  factory _error(final String message) = _$_error<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$_errorCopyWith<T, _$_error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
