import 'package:json_annotation/json_annotation.dart';

part 'picture_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PictureModel {
  PictureModel({
    this.large,
    this.medium,
    this.thumbnail,
  });

  final String? large;
  final String? medium;
  final String? thumbnail;

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
      _$PictureModelFromJson(json);

  Map<String, dynamic> toJson() => _$PictureModelToJson(this);
}
