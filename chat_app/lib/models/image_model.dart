
import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';     /// generated file for this code & .g indicates the part of this file

@JsonSerializable()
class ImageModel {

  final int id;
  final String filename;
  final String? title;
  final String description;

  @JsonKey(name:'url_full_size')
  final String urlFullSize;

  @JsonKey(name:'url_small_size')
  final String urlSmallSize;

  ImageModel({
    required this.id,
    required this.filename,
    this.title,
    required this.description,
    required this.urlFullSize,
    required this.urlSmallSize
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  ImageModel toJson() =>  _$ImageModelFromJson(this as Map<String, dynamic>);





}