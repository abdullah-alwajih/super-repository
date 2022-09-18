part of '../super_repository.dart';

abstract class Model {
  final int offset;
  final int limit;

  const Model({
    required this.offset,
    required this.limit,
  });
}

abstract class BaseModel extends Model {
  const BaseModel({required super.offset, required super.limit});

  List<BaseModel> fromJsonList(List<dynamic> elements);

  BaseModel fromJson(Map<String, dynamic> element);

  Map<String, dynamic> toJson() => {};

  List<dynamic> toJsonList() => [];

  static Future fromMultipartFile(String filePath) async =>
      await MultipartFile.fromFile(filePath);
}
