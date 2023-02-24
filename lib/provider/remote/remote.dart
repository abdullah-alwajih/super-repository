part of '../../super_repository.dart';

enum HttpMethod { get, post, put, delete }

class Remote {
  static Remote? _instance;

  static Remote get instance {
    if (_instance == null) init();
    return _instance!;
  }

  late Dio dio;

  static void init() {
    _instance ??= Remote();

    var options = BaseOptions(
      // baseUrl: AppUrls.baseURL,
      // connectTimeout: 5000,
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
      // sendTimeout: 300000,
    );

    _instance!.dio = Dio(options);
  }

  double sendingRemaining = 0.0;
  double receiveRemaining = 0.0;

  Future<dynamic> send({
    required Request request,
    required HttpMethod method,
  }) async {
    dynamic response;
    try {
      response = await dio.request(
        request.url, queryParameters: request.query,
        data: request.fromData == null
            ? request.data
            : FormData.fromMap(request.fromData),
        options: Options(
          method: method.name,
          headers: Request.addMap(
              header: request.header,
              defaultHeader: SuperRepository.instance.defaultHeader),
        ),
        // onSendProgress: (sent, total) {
        //   sendingRemaining = (total - sent) / total * 100;
        // },
        // onReceiveProgress: (received, total) {
        //   receiveRemaining = (total - received) / total * 100;
        // },
      );
      // .timeout(
      //   Duration(milliseconds: dio!.options.sendTimeout),
      //   onTimeout: () {
      //     throw Exceptions.fromEnumeration(ExceptionTypes.timeout);
      //   },
      // );

      return response.data;
    } on DioError catch (error) {
      final message = error.response?.data['message'] ??
          error.response?.data['Message'] ??
          error.message ??
          error.response?.data['error']?['message'];
      throw Exceptions.fromStatusCode(error.response!.statusCode!, message);
    } catch (exception) {
      rethrow;
    }
  }
}
