import 'dart:developer';

import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/core/services/login.service.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';

import 'base_http.dart';

class HttpClient extends GetxService with BaseApiClient {
  late dio.Dio httpClient;

  HttpClient() {
    httpClient = createDio();
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

  Future<dio.Response> get(String url, {Map<String, dynamic>? params}) async {
    Uri uri = getApiBaseUri(url);
    if (params != null) {
      uri = uri.replace(queryParameters: params);
    }
    return await httpClient.get(url, queryParameters: params);
  }

  Future<dio.Response> post(String url,
      {data, Map<String, dynamic>? params, dio.Options? options}) async {
    Uri uri = getApiBaseUri(url);
    if (params != null) {
      uri = uri.replace(queryParameters: params);
    }
    return await httpClient.postUri(
      uri,
      data: data,
      options: options,
    );
  }

  Future<dio.Response> put(String url,
      {data, Map<String, dynamic>? params}) async {
    Uri uri = getApiBaseUri(url);
    if (params != null) {
      uri = uri.replace(queryParameters: params);
    }
    return await httpClient.putUri(
      uri,
      data: data,
    );
  }

  Future<dio.Response> delete(String url,
      {data, Map<String, dynamic>? params}) async {
    Uri uri = getApiBaseUri(url);
    if (params != null) {
      uri = uri.replace(queryParameters: params);
    }
    return await httpClient.deleteUri(
      uri,
      data: data,
    );
  }
}

class AppInterceptors extends Interceptor {
  final Dio dioClient;

  AppInterceptors(this.dioClient);

  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    var token = localStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
      Get.log(options.headers.toString());
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(err, dio.ErrorInterceptorHandler handler) async {
    print(err.response?.data);
    if (err.response?.statusCode == 401 &&
        Get.currentRoute != Goo.loginScreen) {
      await Get.find<LoginService>().logout();
      Get.offAndToNamed(Goo.loginScreen);
    }
    if (err.response?.statusCode == 500) {
      errorMessage(
          title: "Une erreur est survenue",
          content: "Veuillez réessayer plus tard");
    }

    if (err.response?.data != null && err.response?.data['message'] != null) {
      errorMessage(
          title: "Une erreur est survenue",
          content: "${err.response?.data['message']}");
    }

    handler.next(err);
  }
}
