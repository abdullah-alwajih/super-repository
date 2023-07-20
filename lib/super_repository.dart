library super_repository;

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

part 'data/models/base.dart';
part 'data/models/exceptions.dart';
part 'data/models/response.dart';
part 'data/sources/local/local.dart';
part 'data/sources/local/storage.dart';
part 'data/sources/network_manager.dart';
part 'data/sources/remote/remote.dart';
part 'data/sources/remote/request.dart';

class SuperRepository {
  static late SuperRepository _instance;

  static SuperRepository get instance => _instance;

  Map<String, dynamic> defaultHeader = {};

  late ResponseModel _response;

  Remote get remote => Remote.instance;

  Local get local => Local.instance;

  bool get remoteConnection => NetworkManager.instance.hasConnection;

  /// This is the initialization of the main class of Wings framework
  /// and it should be called before runApp() is called
  static Future<void> initialize(
      {ResponseModel response = const ResponseModel()}) async {
    _instance = SuperRepository();
    await Local.init();
    await NetworkManager.init();
    _instance._response = response;
  }

  Future<dynamic> get({
    required Request request,
    required BaseModel? model,
    bool shouldCache = true,
  }) async {
    try {
      dynamic response;
      if (remoteConnection) {
        response = await remote.send(request: request, method: HttpMethod.get);

        if (response == null) {
          throw Exceptions.fromEnumeration(ExceptionTypes.connection);
        }

        if (shouldCache) {
          local.create(key: request.urlQuery, value: response);
        }
      } else if (shouldCache) {
        response = local.read(key: request.urlQuery);
        if (response == null) {
          throw Exceptions.fromEnumeration(ExceptionTypes.connection);
        }
      } else {
        throw Exceptions.fromEnumeration(ExceptionTypes.connection);
      }
      return _instance._response.format(response, model, request);
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> post({
    required Request request,
    BaseModel? model,
    bool shouldCache = false,
  }) async {
    try {
      dynamic response;
      if (remoteConnection) {
        response = await remote.send(method: HttpMethod.post, request: request);

        if (response.toString().isEmpty) {
          throw Exceptions.fromEnumeration(ExceptionTypes.process);
        }
        if (shouldCache) {
          local.create(
              key: request.urlQuery + request.data, value: request.data);
        }

        return _instance._response.format(response, model, request);
      } else if (shouldCache) {
        request.data == local.read(key: request.urlQuery + request.data)
            ? response = local.read(key: request.urlQuery + request.data)
            : throw const ConflictException();
        if (response != null) return response;
        throw Exceptions.fromEnumeration(ExceptionTypes.connection);
      } else {
        throw Exceptions.fromEnumeration(ExceptionTypes.connection);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> update({
    required Request request,
    BaseModel? model,
    bool shouldCache = false,
  }) async {
    try {
      var response = remote.send(request: request, method: HttpMethod.put);

      if (response.toString().isEmpty) {
        throw Exceptions.fromEnumeration(ExceptionTypes.process);
      }

      return _instance._response.format(response, model, request);
    } catch (_) {
      rethrow;
    }
  }

  Future<dynamic> partialUpdate({
    required Request request,
    BaseModel? model,
    bool shouldCache = false,
  }) async {
    try {
      var response = remote.send(request: request, method: HttpMethod.patch);

      if (response.toString().isEmpty) {
        throw Exceptions.fromEnumeration(ExceptionTypes.process);
      }

      return _instance._response.format(response, model, request);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> delete({
    required Request request,
  }) async {
    try {
      var response =
          await remote.send(request: request, method: HttpMethod.delete);

      if (response.toString().isEmpty) {
        throw Exceptions.fromEnumeration(ExceptionTypes.process);
      }
    } catch (exception) {
      rethrow;
    }
  }
}
