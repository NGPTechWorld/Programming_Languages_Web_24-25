import 'dart:convert';

import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/api/api_response_model.dart';
import 'package:quick_delivery_admin/app/services/api/api_services.dart';
import 'package:quick_delivery_admin/app/services/api/dio_consumer.dart';
import 'package:quick_delivery_admin/app/services/api/end_points.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/core/errors/error_handler.dart';
import 'package:quick_delivery_admin/data/entities/login_entitie.dart';
import 'package:quick_delivery_admin/data/module/manager_model.dart';

abstract class ManagerRepositories {
  Future<AppResponse> login({required String name, required String password});
  Future<AppResponse> logout();
  Future<AppResponse> refreshToken();
  Future<AppResponse> resetPassword(
      {required String old_password,
      required String new_password,
      required String new_password_confirmation});
  Future<AppResponse> currentManager();
  Future<AppResponse> checkToken();
}

class ImpManagerRepositories implements ManagerRepositories {
  final ApiServices api;
  final cache = Get.find<CacheServicesSharedPreferences>();
  ImpManagerRepositories({required this.api});

  @override
  Future<AppResponse> checkToken() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.checkTokenManager,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data;
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> currentManager() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.baserUrl + EndPoints.currentManager,
        method: Method.get,
        requiredToken: true,
      );
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = ManagerModel.fromJson(data['manager']);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> login(
      {required String name, required String password}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.loginManager,
          method: Method.post,
          requiredToken: false,
          params: {ApiKey.name: name, ApiKey.password: password});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = LoginEntitie.fromMap(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> logout() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.logoutmMnager,
          method: Method.post,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> refreshToken() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.refreshTokenManager,
          method: Method.patch,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.bearerToken];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> resetPassword(
      {required String old_password,
      required String new_password,
      required String new_password_confirmation}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.resetPasswordManager,
          method: Method.patch,
          requiredToken: true,
          params: {
            ApiKey.old_password: old_password,
            ApiKey.new_password: new_password,
            ApiKey.new_password_confirmation: new_password_confirmation
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
