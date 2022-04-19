import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    @JsonKey(name: 'description') @Default('') final String description,
    @JsonKey(name: 'sources') @Default([]) final List<String> sources,
    @JsonKey(name: 'subtitle') @Default('') final String subtitle,
    @JsonKey(name: 'thumb') @Default('') final String thumb,
    @JsonKey(name: 'title') @Default('') final String title,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}