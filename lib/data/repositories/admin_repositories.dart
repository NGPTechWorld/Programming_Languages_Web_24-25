import 'dart:convert';

import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/api/api_response_model.dart';
import 'package:quick_delivery_admin/app/services/api/api_services.dart';
import 'package:quick_delivery_admin/app/services/api/dio_consumer.dart';
import 'package:quick_delivery_admin/app/services/api/end_points.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/core/errors/error_handler.dart';
import 'package:quick_delivery_admin/data/entities/Market_card_entite.dart';
import 'package:quick_delivery_admin/data/entities/app_statistics.dart';
import 'package:quick_delivery_admin/data/entities/manager_card_entitie.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';

abstract class AdminRepositories {
  Future<AppResponse> addMarket(
      {required String name,
      required String market_name_en,
      required String market_name_ar,
      required String password,
      required String password_confirmation});
  Future<AppResponse> addAdmin(
      {required String name,
      required String password,
      required String password_confirmation});
  Future<AppResponse> editMarket(
      {required String name_en, required String name_ar, required int id});
  Future<AppResponse> completeOrder({required int id});
  Future<AppResponse> deliverOrder({required int id});
  Future<AppResponse> rejectOrder({required int id});
  Future<AppResponse> deleteMarket({required int id});
  Future<AppResponse> deletProduct({required int id});
  Future<AppResponse> getMarket();
  Future<AppResponse> getProducts();
  Future<AppResponse> getProductsMarket({
    required int id,
  });
  Future<AppResponse> getTopProducts();
  Future<AppResponse> getOrders();
  Future<AppResponse> getAdmins();
  Future<AppResponse> getStatistics();
}

class ImpAdminRepositories implements AdminRepositories {
  final ApiServices api;
  final cache = Get.find<CacheServicesSharedPreferences>();
  ImpAdminRepositories({required this.api});

  @override
  Future<AppResponse> addAdmin(
      {required String name,
      required String password,
      required String password_confirmation}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.addAdmin,
          method: Method.post,
          requiredToken: true,
          params: {
            "name": name,
            "password": password,
            "password_confirmation": password_confirmation
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data["admin"]['id'];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> addMarket(
      {required String name,
      required String market_name_en,
      required String market_name_ar,
      required String password,
      required String password_confirmation}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.addMarket,
          method: Method.post,
          requiredToken: true,
          params: {
            "name": name,
            "market_name_en": market_name_en,
            "market_name_ar": market_name_ar,
            "password": password,
            "password_confirmation": password_confirmation
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data["manager"]['id'];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> completeOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.completeOrder + id.toString(),
          method: Method.put,
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
  Future<AppResponse> deletProduct({required int id}) {
    // TODO: implement deletProduct
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> deleteMarket({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.deleteMarket + id.toString(),
          method: Method.delete,
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
  Future<AppResponse> deliverOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.deliverOrder + id.toString(),
          method: Method.put,
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
  Future<AppResponse> editMarket(
      {required String name_en,
      required String name_ar,
      required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.editMarket + id.toString(),
          method: Method.put,
          requiredToken: true,
          params: {
            "name_en": name_en,
            "name_ar": name_ar,
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data["market"]['id'];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getMarket() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getMarkets,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['markets'] as List<dynamic>;
      response.data =
          listData.map((json) => MarketCardEntite.fromJson(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getOrders() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getOrders,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['orders'] as List<dynamic>;
      response.data =
          listData.map((json) => OrderModel.fromJson(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProducts() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getProducts,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['products'] as List<dynamic>;
      response.data =
          listData.map((json) => ProductsCardEntite.fromJson(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProductsMarket({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getProductsMarket + id.toString(),
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['products'] as List<dynamic>;
      response.data =
          listData.map((json) => ProductsCardEntite.fromJson(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getStatistics() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.statisticsAdmin,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = AppStatistics.fromJson(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getTopProducts() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getTopProductsAdmin,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['products'] as List<dynamic>;
      response.data =
          listData.map((json) => ProductsCardEntite.fromJson(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> rejectOrder({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.rejectOrder + id.toString(),
          method: Method.put,
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
  Future<AppResponse> getAdmins() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getAdmins,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['admins'] as List<dynamic>;
      response.data =
          listData.map((json) => ManagerCardEntitie.fromJson(json)).toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
