library super_repository;

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

part 'data/models/base.dart';
part 'data/models/exceptions.dart';
part 'data/models/response.dart';
part 'data/sources/data_sources.dart';
part 'data/sources/local/local.dart';
part 'data/sources/local/storage.dart';
part 'data/sources/network_manager.dart';
part 'data/sources/remote/remote.dart';
part 'data/sources/remote/request.dart';

class SuperRepository {
  static SuperRepository? _instance;

  static SuperRepository get instance => _instance ??= SuperRepository();

  static DataSources get sources => DataSources.instance;

  Map<String, dynamic> defaultHeader = {};

  late ResponseModel _response;

  /// This is the initialization of the main class of Wings framework
  /// and it should be called before runApp() is called
  static Future<void> initialize(
      {ResponseModel response = const ResponseModel()}) async {
    _instance ??= SuperRepository();
    await DataSources.init();
    _instance?._response = response;
  }

  Future<dynamic> getData({
    required Request request,
    required BaseModel? model,
    bool shouldCache = true,
  }) async {
    try {
      var response =
          await sources.get(request: request, shouldCache: shouldCache);
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
          await sources.insert(request: request, shouldCache: shouldCache);
      return await responseFormat(response, model, request);
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> responseFormat(
      dynamic response, BaseModel? model, Request request) async {
    if (model == null) return response;

    if (!(response[_instance?._response.check] ?? true)) {
      throw response[_instance?._response.message];
    }

    if (response[_instance?._response.data]?.isEmpty ?? true) {
      return response[_instance?._response.message];
    }

    response = (request.query?.containsKey('offset') ?? false) ||
            (request.query?.containsKey('page') ?? false)
        ? (_instance?._response.pagination == null
            ? response[_instance?._response.data]
            : response[_instance?._response.data][_response.pagination])
        : response[_instance?._response.data];
    if (response is List) {
      return model.fromJsonList(response);
    } else if (response is Map<String, dynamic>) {
      return model.fromJson(response);
    } else {
      return response;
    }
  }
}
