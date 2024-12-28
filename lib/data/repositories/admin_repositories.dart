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
  Future<AppResponse> editMarket({
    required String name_en,
    required String name_ar,
  });
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
  Future<AppResponse> getStatistics();

}

class ImpAdminRepositories implements AdminRepositories {
  final ApiServices api;
  final cache = Get.find<CacheServicesSharedPreferences>();
  ImpAdminRepositories({required this.api});
  
  @override
  Future<AppResponse> addAdmin({required String name, required String password, required String password_confirmation}) {
    // TODO: implement addAdmin
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> addMarket({required String name, required String market_name_en, required String market_name_ar, required String password, required String password_confirmation}) {
    // TODO: implement addMarket
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> completeOrder({required int id}) {
    // TODO: implement completeOrder
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> deletProduct({required int id}) {
    // TODO: implement deletProduct
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> deleteMarket({required int id}) {
    // TODO: implement deleteMarket
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> deliverOrder({required int id}) {
    // TODO: implement deliverOrder
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> editMarket({required String name_en, required String name_ar}) {
    // TODO: implement editMarket
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getMarket() {
    // TODO: implement getMarket
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getProductsMarket({required int id}) {
    // TODO: implement getProductsMarket
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getStatistics() {
    // TODO: implement getStatistics
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getTopProducts() {
    // TODO: implement getTopProducts
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> rejectOrder({required int id}) {
    // TODO: implement rejectOrder
    throw UnimplementedError();
  }
}
