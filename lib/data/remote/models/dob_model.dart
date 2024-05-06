import 'package:json_annotation/json_annotation.dart';

part 'dob_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DOBModel {
  DOBModel({this.date, this.age});

  final DateTime? date;
  final int? age;

  factory DOBModel.fromJson(Map<String, dynamic> json) =>
      _$DOBModelFromJson(json);

  Map<String, dynamic> toJson() => _$DOBModelToJson(this);
}
