library super_repository;

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

part 'error/exceptions.dart';
part 'provider/local/local.dart';
part 'provider/local/storage.dart';
part 'provider/main_provider.dart';
part 'provider/models/base.dart';
part 'provider/models/response.dart';
part 'provider/network_manager.dart';
part 'provider/remote/remote.dart';
part 'provider/remote/request.dart';

class SuperRepository {
  static SuperRepository? _instance;

  static SuperRepository get instance => _instance ??= SuperRepository();

  static DataProvider get provider => DataProvider.instance;

  Map<String, dynamic> defaultHeader = {};

  late ResponseModel _response;

  /// This is the initialization of the main class of Wings framework
  /// and it should be called before runApp() is called
  static Future<void> initialize(
      {ResponseModel response = const ResponseModel()}) async {
    _instance ??= SuperRepository();
    await DataProvider.init();
    _instance?._response = response;
  }

  Future<dynamic> getData({
    required Request request,
    required BaseModel? model,
    bool shouldCache = true,
  }) async {
    try {
      var response =
          await provider.get(request: request, shouldCache: shouldCache);
      return await responseFormat(response, model, request);
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
      return await responseFormat(response, model, request);
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> responseFormat(
      dynamic response, BaseModel? model, Request request) async {
    if (model == null) return response;

    if (!(response[_response.check] ?? true)) throw response[_response.message];

    if (response[_response.data]?.isEmpty ?? true) {
      return response[_response.message];
    }

    response = (request.query?.containsKey('offset') ?? false) ||
            (request.query?.containsKey('page') ?? false)
        ? (_response.pagination == null
            ? response[_response.data]
            : response[_response.data][_response.pagination])
        : response[_response.data];
    if (response is List) {
      return model.fromJsonList(response);
    } else if (response is Map<String, dynamic>) {
      return model.fromJson(response);
    } else {
      return response;
    }
  }
}
