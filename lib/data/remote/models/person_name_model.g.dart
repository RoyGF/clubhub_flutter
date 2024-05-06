// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonNameModel _$PersonNameModelFromJson(Map<String, dynamic> json) =>
    PersonNameModel(
      title: json['title'] as String?,
      first: json['first'] as String?,
      last: json['last'] as String?,
    );

Map<String, dynamic> _$PersonNameModelToJson(PersonNameModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };
