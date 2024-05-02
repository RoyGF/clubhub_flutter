import 'package:json_annotation/json_annotation.dart';

part 'person_name_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonNameModel {
  final String? title;
  final String? first;
  final String? last;

  PersonNameModel({
    this.title,
    this.first,
    this.last,
  });

  factory PersonNameModel.fromJson(Map<String, dynamic> json) =>
      _$PersonNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonNameModelToJson(this);
}
