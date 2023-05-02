part of '../../super_repository.dart';

class ResponseModel {
  final String check;
  final String message;
  final String data;
  final String? pagination;

  const ResponseModel({
    this.check = 'success',
    this.message = 'message',
    this.data = 'data',
    this.pagination = 'data',
  });

  dynamic format(dynamic response, BaseModel? model, Request request) {
    if (model == null) return response;

    if (!(response[check] ?? true)) throw response[message];

    if (response[data]?.isEmpty ?? true) return response[message];

    response = (request.query?.containsKey('offset') ?? false) ||
            (request.query?.containsKey('page') ?? false)
        ? (pagination == null ? response[data] : response[data][pagination])
        : response[data];

    if (response is List) {
      return model.fromJsonList(response);
    } else if (response is Map<String, dynamic>) {
      return model.fromJson(response);
    } else {
      return response;
    }
  }
}
