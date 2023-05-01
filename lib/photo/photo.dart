import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required Urls urls,
    @JsonKey(name: 'liked_by_user') required bool likedByUser,
  }) = Photo$;

  factory Photo.fromJson(Map<dynamic, dynamic> json) => _$PhotoFromJson(Map<String, dynamic>.from(json));
}

@freezed
class Urls with _$Urls {
  const factory Urls({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
    @JsonKey(name: 'small_s3') required String smallS3,
  }) = Urls$;

  factory Urls.fromJson(Map<dynamic, dynamic> json) => _$UrlsFromJson(Map<String, dynamic>.from(json));
}
