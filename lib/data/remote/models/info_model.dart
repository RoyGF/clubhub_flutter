import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoModel {
  InfoModel({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String? seed;
  int? results;
  int? page;
  String? version;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
