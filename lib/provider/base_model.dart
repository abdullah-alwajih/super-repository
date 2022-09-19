part of '../super_repository.dart';

// class Base extends BaseModel {
//   final int? offset;
//   final int? limit;
//   final List? data;
//
//   const Base({
//     this.limit,
//     this.offset,
//     this.data,
//   });
//
// }

abstract class BaseModel {
  const BaseModel();

  List<BaseModel> fromJsonList(List<dynamic> elements);

  BaseModel fromJson(Map<String, dynamic> element);

  Map<String, dynamic> toJson() => {};

  List<dynamic> toJsonList() => [];

  static Future fromMultipartFile(String filePath) async =>
      await MultipartFile.fromFile(filePath);
}
