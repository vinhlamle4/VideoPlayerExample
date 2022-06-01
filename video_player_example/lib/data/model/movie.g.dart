// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      description: json['description'] as String? ?? '',
      sources: (json['sources'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subtitle: json['subtitle'] as String? ?? '',
      thumb: json['thumb'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'description': instance.description,
      'sources': instance.sources,
      'subtitle': instance.subtitle,
      'thumb': instance.thumb,
      'title': instance.title,
    };
