part of '../../super_repository.dart';

class Request {
  final String url;
  final Map<String, dynamic>? header;
  final Map<String, dynamic> parameters;
  final dynamic data;
  final dynamic fromData;
  final bool nullable;

  const Request({
    required this.url,
    this.nullable = false,
    this.parameters = const {},
    this.data,
    this.fromData,
    this.header,
  });

  String get urlQuery => url + parameters.toString();

  static Map<String, dynamic> addMap({
    required Map<String, dynamic>? header,
    required Map<String, dynamic> defaultHeader,
  }) {
    if (header == null) return defaultHeader;
    defaultHeader.forEach((key, value) {
      if (!header.containsKey(key)) header[key] = value;
    });
    return header;
  }
}
