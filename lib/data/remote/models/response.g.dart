// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: json['info'] == null
          ? null
          : InfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'info': instance.info?.toJson(),
    };
