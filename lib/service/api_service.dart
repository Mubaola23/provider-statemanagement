import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:todoly/service/api.dart';

class ApiService implements Api {
  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        responseType: ResponseType.json,
        followRedirects: true,
      ),
    );

// Certificate pinning
    // ignore: deprecated_member_use
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   SecurityContext sc = SecurityContext();
    //   final List<int> bytes = utf8.encode('certificate here');
    //   sc.setTrustedCertificatesBytes(bytes);
    //   return HttpClient(context: sc);
    // };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.followRedirects = true;
        options.validateStatus = (status) {
          return status! < 400; // Accept all status codes less than 400
        };
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        _handleError(error);
        return handler.next(error);
      },
    ));
  }

//This is a simple method to perform post request using dio, can be addjusted to fit needs
  @override
  Future<dynamic> post(String url, {dynamic body}) async {
    try {
      final response = await dio.post(url, data: body);
      return _processResponse(response);
    } catch (ex) {
      _handleError(ex);
    }
  }

//This is a simple method to perform get request using dio, can be addjusted to fit needs
  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return _processResponse(response);
    } catch (ex) {
      _handleError(ex);
    }
  }

  dynamic _processResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } else {
      throw Exception(
          response.statusMessage ?? "Something went wrong, Try again");
    }
  }

  void _handleError(dynamic error) {
    if (error is DioException &&
        error.type == DioExceptionType.connectionTimeout) {
      throw Exception("Check your internet connection.");
    } else {
      throw Exception("An unexpected error occurred.");
    }
  }
}
