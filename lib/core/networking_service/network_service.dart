import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_review/core/networking_service/app_exceptions.dart';

abstract class NetworkService {
  Future<dynamic> getData({required url});
}

class NetworkClientImpl extends NetworkService {
  final Dio _dio = Dio();
  NetworkClientImpl() {
    _dio.options.connectTimeout = const Duration(seconds: 15000);
    _dio.options.receiveTimeout = const Duration(seconds: 9000);
    _dio.options.responseType = ResponseType.json;
    _dio.options.baseUrl = "https://api.themoviedb.org";
    _dio.interceptors.add(AuthorizationTokenInjector());
    _dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<dynamic> getData({required url}) async {
    try {
      final response = await _dio.get(
        url,
      );

      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}

class AuthorizationTokenInjector extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["Authorization"] =dotenv.env['API_KEY'];
    super.onRequest(options, handler);
  }
}

class LogInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log("REQUEST: ${options.uri}: ${options.data} ${options.headers}");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log("RESPONSE: ${response.realUri}: ${response.data}");
    return super.onResponse(response, handler);
  }
}
