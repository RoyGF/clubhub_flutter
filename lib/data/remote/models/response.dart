import 'package:clubhub/data/remote/models/info_model.dart';
import 'package:clubhub/data/remote/models/person_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
  Response({
    this.results,
    this.info,
  });

  List<PersonModel>? results;
  InfoModel? info;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
