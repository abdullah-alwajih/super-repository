part of '../../super_repository.dart';

class Request {
  final String url;
  final Map<String, dynamic>? header;
  final Map<String, dynamic> query;
  final dynamic body;
  final bool nullable;

  const Request({
    required this.url,
    this.nullable = false,
    this.query = const {},
    this.body = const {},
    this.header,
  });

  String get urlQuery => url + query.toString();

  static Map<String, dynamic> addMap({
    required Map<String, dynamic> header,
    required  Map<String, dynamic>? defaultHeader,
  }) {
    if (defaultHeader == null) return header;
    defaultHeader.forEach((key, value) => header[key] = value);
    return header;
  }

// String _queryFormat() {
//   String _query = '';
//     debugPrint(query.toString());
//   if (query.isNotEmpty) {
//     _query = '?';
//
//     query.forEach((key, value) {
//       _query += '$key=$value&';
//     });
//
//     _query = _query.substring(0, query.length - 1);
//   }
//
//   return _query;
// }
}


