import 'package:clubhub/data/remote/models/person_name_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonModel {
  final String? gender;
  final String? phone;
  final String? email;
  final String? cell;
  final PersonNameModel? name;

  PersonModel({
    this.gender,
    this.phone,
    this.email,
    this.cell,
    this.name,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
