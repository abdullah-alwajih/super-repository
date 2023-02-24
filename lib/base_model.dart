part of 'super_repository.dart';

abstract class BaseModel {
  const BaseModel();

  List<BaseModel> fromJsonList(List<dynamic> elements);

  BaseModel fromJson(Map<String, dynamic> element);

  Map<String, dynamic> toJson() => {};

  List<dynamic> toJsonList() => [];

  static Future fromMultipartFile(String filePath) async =>
      await MultipartFile.fromFile(filePath);
}
