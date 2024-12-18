import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ngpiteapp/app/core/errors/error_handler.dart';
import 'package:ngpiteapp/app/services/api/api_services.dart';
import 'package:get/get.dart' as getx;
import 'package:ngpiteapp/app/services/local_storage/cache_services_with_sharedpreferences.dart';

class DioConsumer implements ApiServices {
  final Dio dio = Dio();
  CacheServicesSharedPreferences cacheService =
      getx.Get.find<CacheServicesSharedPreferences>();
  DioConsumer();

  dynamic request({
    required String url,
    required Method method,
    required bool requiredToken,
    Map<String, dynamic>? queryParameters,
    bool uploadImage = false,
    //Map<String, dynamic>? params,
    Object? params,
  }) async {
    Response response;

    Map<String, dynamic> headers = {};

    headers.addAll({
      'Content-Type': 'application/json',
      "Accept": "application/json",
    });

    if (requiredToken) {
      String? token = await cacheService.getUserToken();
      debugPrint("token => $token");

      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    if (uploadImage) {
      headers['Accept'] = 'text/plain';
      headers['Content-Type'] = 'multipart/form-data';
      /*headers = {
        'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer ${await sessionService.getUserToken()}",
      };*/
    }

    Options options = Options(
      headers: headers,
    );
    debugPrint("response url:$url");
    /*try {*/
    try {
      if (method == Method.post) {
        response = await dio.post(
          url,
          data: params,
          options: options,
        );
      } else if (method == Method.delete) {
        response = await dio.delete(
          url,
          options: options,
          data: params,
        );
      } else if (method == Method.patch) {
        response = await dio.patch(
          url,
          options: options,
          data: params,
        );
      } else if (method == Method.put) {
        response = await dio.put(
          url,
          options: options,
          data: params,
        );
      } else {
        response = await dio.get(
          url,
          queryParameters: queryParameters,
          options: options,
        );
      }
    } on DioException catch (e) {
      if (e.response != null) debugPrint(e.response!.data.toString());
      throw ErrorHandler.handle(e);
    }
    return response;
  }
}

enum Method { get, post, put, delete, patch }

class TokenExpiredException implements Exception {
  String message;
  TokenExpiredException(this.message);
}
