// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo$.fromJson(json);
}

/// @nodoc
mixin _$Photo {
  Urls get urls => throw _privateConstructorUsedError;
  @JsonKey(name: 'liked_by_user')
  bool get likedByUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) = _$PhotoCopyWithImpl<$Res, Photo>;
  @useResult
  $Res call({Urls urls, @JsonKey(name: 'liked_by_user') bool likedByUser});

  $UrlsCopyWith<$Res> get urls;
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res, $Val extends Photo> implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? likedByUser = null,
  }) {
    return _then(_value.copyWith(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Urls,
      likedByUser: null == likedByUser
          ? _value.likedByUser
          : likedByUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UrlsCopyWith<$Res> get urls {
    return $UrlsCopyWith<$Res>(_value.urls, (value) {
      return _then(_value.copyWith(urls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$Photo$CopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$$Photo$CopyWith(_$Photo$ value, $Res Function(_$Photo$) then) = __$$Photo$CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Urls urls, @JsonKey(name: 'liked_by_user') bool likedByUser});

  @override
  $UrlsCopyWith<$Res> get urls;
}

/// @nodoc
class __$$Photo$CopyWithImpl<$Res> extends _$PhotoCopyWithImpl<$Res, _$Photo$> implements _$$Photo$CopyWith<$Res> {
  __$$Photo$CopyWithImpl(_$Photo$ _value, $Res Function(_$Photo$) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? likedByUser = null,
  }) {
    return _then(_$Photo$(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Urls,
      likedByUser: null == likedByUser
          ? _value.likedByUser
          : likedByUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Photo$ implements Photo$ {
  const _$Photo$({required this.urls, @JsonKey(name: 'liked_by_user') required this.likedByUser});

  factory _$Photo$.fromJson(Map<String, dynamic> json) => _$$Photo$FromJson(json);

  @override
  final Urls urls;
  @override
  @JsonKey(name: 'liked_by_user')
  final bool likedByUser;

  @override
  String toString() {
    return 'Photo(urls: $urls, likedByUser: $likedByUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Photo$ &&
            (identical(other.urls, urls) || other.urls == urls) &&
            (identical(other.likedByUser, likedByUser) || other.likedByUser == likedByUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, urls, likedByUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Photo$CopyWith<_$Photo$> get copyWith => __$$Photo$CopyWithImpl<_$Photo$>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Photo$ToJson(
      this,
    );
  }
}

abstract class Photo$ implements Photo {
  const factory Photo$({required final Urls urls, @JsonKey(name: 'liked_by_user') required final bool likedByUser}) =
      _$Photo$;

  factory Photo$.fromJson(Map<String, dynamic> json) = _$Photo$.fromJson;

  @override
  Urls get urls;
  @override
  @JsonKey(name: 'liked_by_user')
  bool get likedByUser;
  @override
  @JsonKey(ignore: true)
  _$$Photo$CopyWith<_$Photo$> get copyWith => throw _privateConstructorUsedError;
}

Urls _$UrlsFromJson(Map<String, dynamic> json) {
  return Urls$.fromJson(json);
}

/// @nodoc
mixin _$Urls {
  String get raw => throw _privateConstructorUsedError;
  String get full => throw _privateConstructorUsedError;
  String get regular => throw _privateConstructorUsedError;
  String get small => throw _privateConstructorUsedError;
  String get thumb => throw _privateConstructorUsedError;
  @JsonKey(name: 'small_s3')
  String get smallS3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UrlsCopyWith<Urls> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlsCopyWith<$Res> {
  factory $UrlsCopyWith(Urls value, $Res Function(Urls) then) = _$UrlsCopyWithImpl<$Res, Urls>;
  @useResult
  $Res call(
      {String raw, String full, String regular, String small, String thumb, @JsonKey(name: 'small_s3') String smallS3});
}

/// @nodoc
class _$UrlsCopyWithImpl<$Res, $Val extends Urls> implements $UrlsCopyWith<$Res> {
  _$UrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? full = null,
    Object? regular = null,
    Object? small = null,
    Object? thumb = null,
    Object? smallS3 = null,
  }) {
    return _then(_value.copyWith(
      raw: null == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      full: null == full
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as String,
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
      smallS3: null == smallS3
          ? _value.smallS3
          : smallS3 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Urls$CopyWith<$Res> implements $UrlsCopyWith<$Res> {
  factory _$$Urls$CopyWith(_$Urls$ value, $Res Function(_$Urls$) then) = __$$Urls$CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String raw, String full, String regular, String small, String thumb, @JsonKey(name: 'small_s3') String smallS3});
}

/// @nodoc
class __$$Urls$CopyWithImpl<$Res> extends _$UrlsCopyWithImpl<$Res, _$Urls$> implements _$$Urls$CopyWith<$Res> {
  __$$Urls$CopyWithImpl(_$Urls$ _value, $Res Function(_$Urls$) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? full = null,
    Object? regular = null,
    Object? small = null,
    Object? thumb = null,
    Object? smallS3 = null,
  }) {
    return _then(_$Urls$(
      raw: null == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as String,
      full: null == full
          ? _value.full
          : full // ignore: cast_nullable_to_non_nullable
              as String,
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
      smallS3: null == smallS3
          ? _value.smallS3
          : smallS3 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Urls$ implements Urls$ {
  const _$Urls$(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb,
      @JsonKey(name: 'small_s3') required this.smallS3});

  factory _$Urls$.fromJson(Map<String, dynamic> json) => _$$Urls$FromJson(json);

  @override
  final String raw;
  @override
  final String full;
  @override
  final String regular;
  @override
  final String small;
  @override
  final String thumb;
  @override
  @JsonKey(name: 'small_s3')
  final String smallS3;

  @override
  String toString() {
    return 'Urls(raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb, smallS3: $smallS3)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Urls$ &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.full, full) || other.full == full) &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.thumb, thumb) || other.thumb == thumb) &&
            (identical(other.smallS3, smallS3) || other.smallS3 == smallS3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, raw, full, regular, small, thumb, smallS3);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Urls$CopyWith<_$Urls$> get copyWith => __$$Urls$CopyWithImpl<_$Urls$>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Urls$ToJson(
      this,
    );
  }
}

abstract class Urls$ implements Urls {
  const factory Urls$(
      {required final String raw,
      required final String full,
      required final String regular,
      required final String small,
      required final String thumb,
      @JsonKey(name: 'small_s3') required final String smallS3}) = _$Urls$;

  factory Urls$.fromJson(Map<String, dynamic> json) = _$Urls$.fromJson;

  @override
  String get raw;
  @override
  String get full;
  @override
  String get regular;
  @override
  String get small;
  @override
  String get thumb;
  @override
  @JsonKey(name: 'small_s3')
  String get smallS3;
  @override
  @JsonKey(ignore: true)
  _$$Urls$CopyWith<_$Urls$> get copyWith => throw _privateConstructorUsedError;
}
