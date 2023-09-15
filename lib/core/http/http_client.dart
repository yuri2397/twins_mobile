import 'dart:developer';

import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/core/services/login.service.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/routes/router.dart';

import 'base_http.dart';

class HttpClient extends GetxService with BaseApiClient {
  late dio.Dio httpClient;

  HttpClient() {
    httpClient = createDio();
    Get.log('Twins Http Client created');
    Get.log('baseUrl: $baseUrl');
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 10),
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
      {data, Map<String, dynamic>? params}) async {
    Uri uri = getApiBaseUri(url);
    if (params != null) {
      uri = uri.replace(queryParameters: params);
    }
    Get.log(uri.toString());
    return await httpClient.postUri(uri, data: data);
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
    }
    Get.log(
        "REQUEST[${options.method}] => PATH: ${options.path}, DATA: ${options.data}");
    return handler.next(options);
  }

  @override
  Future<void> onError(err, dio.ErrorInterceptorHandler handler) async {
    Get.log("DATA ERR: ${err.response?.data}");
    if (err.response?.statusCode == 401 &&
        Get.currentRoute != Goo.loginScreen) {
      await Get.find<LoginService>().logout();
      Get.offAndToNamed(Goo.loginScreen);
    } else if (err.response?.statusCode == 422) {
      errorMessage(
          title: "Oups, erreur !", content: err.response?.data['message']);
    }

    handler.next(err);
  }
}
