part of '../../super_repository.dart';

class ResponseModel {
  final String check;
  final String message;
  final String? data;
  final String? pagination;

  const ResponseModel({
    this.check = 'success',
    this.message = 'message',
    this.data = 'data',
    this.pagination,
  });

  dynamic format(dynamic response, BaseModel? model, Request request) {
    if (model == null) return response;

    if (!(response[check] ?? true)) throw response[message];

    final responseData = response[data];
    if (responseData?.isEmpty ?? true) return response[message];

    final bool hasOffsetQuery = request.query?.containsKey('offset') ?? false;
    final bool hasPageQuery = request.query?.containsKey('page') ?? false;

    final extractedData = hasOffsetQuery || hasPageQuery
        ? (responseData?[pagination]) ?? responseData
        : responseData ?? response;

    return extractedData is List
        ? model.fromJsonList(extractedData)
        : extractedData is Map<String, dynamic>
            ? model.fromJson(extractedData)
            : extractedData;
  }
}
