part of '../../super_repository.dart';

class Request {
  final String url;
  final Map<String, dynamic>? header;
  final Map<String, dynamic>? query;
  final dynamic data;
  final dynamic fromData;

  const Request({
    required this.url,
    this.header,
    this.query,
    this.data,
    this.fromData,
  });

  String get urlQuery => url + query.toString();

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
