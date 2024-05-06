// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      cell: json['cell'] as String?,
      name: json['name'] == null
          ? null
          : PersonNameModel.fromJson(json['name'] as Map<String, dynamic>),
      login: json['login'] == null
          ? null
          : LoginModel.fromJson(json['login'] as Map<String, dynamic>),
      picture: json['picture'] == null
          ? null
          : PictureModel.fromJson(json['picture'] as Map<String, dynamic>),
      dob: json['dob'] == null
          ? null
          : DOBModel.fromJson(json['dob'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'cell': instance.cell,
      'name': instance.name?.toJson(),
      'login': instance.login?.toJson(),
      'picture': instance.picture?.toJson(),
      'dob': instance.dob?.toJson(),
    };
