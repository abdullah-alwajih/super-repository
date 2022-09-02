library super_repository;

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

part 'error/exceptions.dart';
part 'provider/base_model.dart';
part 'provider/local/local.dart';
part 'provider/main_provider.dart';
part 'provider/network_manager.dart';
part 'provider/remote/remote.dart';
part 'provider/remote/request.dart';

class SuperRepository {
  static SuperRepository? _instance;

  static SuperRepository get instance => _instance ??= SuperRepository();

  static DataProvider get provider => DataProvider.instance;

  /// This is the initialization of the main class of Wings framework
  /// and it should be called before runApp() is called
  // static Future<void> init() async {
  //   _instance ??= SuperRepository();
  //   await DataProvider.init();
  // }

  Map<String, dynamic> defaultHeaders = {};

  Future<dynamic> getData({
    required Request request,
    required BaseModel? model,
    bool shouldCache = true,
  }) async {
    try {
      var response =
          await provider.get(request: request, shouldCache: shouldCache);

      // if (provider.error.message.isNotEmpty) {
      // throw provider.error.exception.runtimeType ==
      //     Exceptions.fromEnumeration(ExceptionTypes.empty).runtimeType
      //     ? (emptyException ?? provider.error)
      //     : provider.error;
      // }

      // if (response['data'] == null || response['data'].isEmpty) {
      //   if (response['status'] ?? true) {
      //     return response["message"];
      //   } else {
      //     throw response["message"];
      //   }
      // } else {

      response = response['data'];

      if (model != null) {
        if (response is List) {
          return model.fromJsonList(response);
        } else if (response is Map<String, dynamic>) {
          return model.fromJson(response);
        } else {
          return response;
        }
      } else {
        return response;
      }
      // }
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> sendData({
    required Request request,
    BaseModel? model,
    bool shouldCache = false,
  }) async {
    try {
      var response =
          await provider.insert(request: request, shouldCache: shouldCache);

      if (!(response['status'] ?? true)) throw response["message"];

      if (response['data'] == null || response['data'].isEmpty) {
        if (response['status'] ?? true) {
          return response["message"];
        } else {
          throw response["message"];
        }
      } else {
        response = response['data'];
        if (model != null) {
          if (response is List) {
            return model.fromJsonList(response);
          } else if (response is Map<String, dynamic>) {
            return model.fromJson(response);
          } else {
            return response;
          }
        } else {
          return response;
        }
      }
    } catch (_) {
      rethrow;
    }
  }
}
