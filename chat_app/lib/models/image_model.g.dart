// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
  id: (json['id'] as num).toInt(),
  filename: json['filename'] as String,
  title: json['title'] as String?,
  description: json['description'] as String,
  urlFullSize: json['url_full_size'] as String,
  urlSmallSize: json['url_small_size'] as String,
);

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'description': instance.description,
      'url_full_size': instance.urlFullSize,
      'url_small_size': instance.urlSmallSize,
    };
