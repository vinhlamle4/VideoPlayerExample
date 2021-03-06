// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
class _$MovieTearOff {
  const _$MovieTearOff();

  _Movie call(
      {@JsonKey(name: 'description') String description = '',
      @JsonKey(name: 'sources') List<String> sources = const [],
      @JsonKey(name: 'subtitle') String subtitle = '',
      @JsonKey(name: 'thumb') String thumb = '',
      @JsonKey(name: 'title') String title = ''}) {
    return _Movie(
      description: description,
      sources: sources,
      subtitle: subtitle,
      thumb: thumb,
      title: title,
    );
  }

  Movie fromJson(Map<String, Object?> json) {
    return Movie.fromJson(json);
  }
}

/// @nodoc
const $Movie = _$MovieTearOff();

/// @nodoc
mixin _$Movie {
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'sources')
  List<String> get sources => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtitle')
  String get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumb')
  String get thumb => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'description') String description,
      @JsonKey(name: 'sources') List<String> sources,
      @JsonKey(name: 'subtitle') String subtitle,
      @JsonKey(name: 'thumb') String thumb,
      @JsonKey(name: 'title') String title});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  final Movie _value;
  // ignore: unused_field
  final $Res Function(Movie) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? sources = freezed,
    Object? subtitle = freezed,
    Object? thumb = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sources: sources == freezed
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: thumb == freezed
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) then) =
      __$MovieCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'description') String description,
      @JsonKey(name: 'sources') List<String> sources,
      @JsonKey(name: 'subtitle') String subtitle,
      @JsonKey(name: 'thumb') String thumb,
      @JsonKey(name: 'title') String title});
}

/// @nodoc
class __$MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res>
    implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(_Movie _value, $Res Function(_Movie) _then)
      : super(_value, (v) => _then(v as _Movie));

  @override
  _Movie get _value => super._value as _Movie;

  @override
  $Res call({
    Object? description = freezed,
    Object? sources = freezed,
    Object? subtitle = freezed,
    Object? thumb = freezed,
    Object? title = freezed,
  }) {
    return _then(_Movie(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      sources: sources == freezed
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: thumb == freezed
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie implements _Movie {
  _$_Movie(
      {@JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'sources') this.sources = const [],
      @JsonKey(name: 'subtitle') this.subtitle = '',
      @JsonKey(name: 'thumb') this.thumb = '',
      @JsonKey(name: 'title') this.title = ''});

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$$_MovieFromJson(json);

  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'sources')
  final List<String> sources;
  @override
  @JsonKey(name: 'subtitle')
  final String subtitle;
  @override
  @JsonKey(name: 'thumb')
  final String thumb;
  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  String toString() {
    return 'Movie(description: $description, sources: $sources, subtitle: $subtitle, thumb: $thumb, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Movie &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.sources, sources) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality().equals(other.thumb, thumb) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(sources),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(thumb),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$MovieCopyWith<_Movie> get copyWith =>
      __$MovieCopyWithImpl<_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieToJson(this);
  }
}

abstract class _Movie implements Movie {
  factory _Movie(
      {@JsonKey(name: 'description') String description,
      @JsonKey(name: 'sources') List<String> sources,
      @JsonKey(name: 'subtitle') String subtitle,
      @JsonKey(name: 'thumb') String thumb,
      @JsonKey(name: 'title') String title}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'sources')
  List<String> get sources;
  @override
  @JsonKey(name: 'subtitle')
  String get subtitle;
  @override
  @JsonKey(name: 'thumb')
  String get thumb;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(ignore: true)
  _$MovieCopyWith<_Movie> get copyWith => throw _privateConstructorUsedError;
}
