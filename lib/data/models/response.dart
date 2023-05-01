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
}
