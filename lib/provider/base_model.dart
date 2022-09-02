part of '../super_repository.dart';


abstract class BaseModel {
  List<BaseModel> fromJsonList(List<dynamic> elements);

  BaseModel fromJson(Map<String, dynamic> element);

  Map<String, dynamic> toJson()=>{};

  List<dynamic> toJsonList()=>[];
}
