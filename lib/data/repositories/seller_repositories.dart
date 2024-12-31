import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:quick_delivery_admin/app/services/api/api_response_model.dart';
import 'package:quick_delivery_admin/app/services/api/api_services.dart';
import 'package:quick_delivery_admin/app/services/api/dio_consumer.dart';
import 'package:quick_delivery_admin/app/services/api/end_points.dart';
import 'package:quick_delivery_admin/core/errors/error_handler.dart';
import 'package:quick_delivery_admin/data/entities/marcket_statistics.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/module/category_model.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';

abstract class SellerRepositories {
  Future<AppResponse> addProduct(
      {required String name_en,
      required String name_ar,
      required int category_id,
      int? quantity,
      int? price,
      required String description_en,
      required String description_ar});
  Future<AppResponse> uploadImage({required dio.FormData image});
  Future<AppResponse> uploadImageProduct(
      {required dio.FormData image, required int id});
  Future<AppResponse> editProduct(
      {required String name_en,
      required String name_ar,
      required int category_id,
      int? quantity,
      int? price,
      required String description_en,
      required String description_ar,
      required int id});
  Future<AppResponse> completeOrder({required int id});
  Future<AppResponse> rejectOrder({required int id});
  Future<AppResponse> deleteProduct({required int id});
  Future<AppResponse> deleteProductImage({required int id});
  Future<AppResponse> deleteImage();
  Future<AppResponse> getProducts();
  Future<AppResponse> getProduct(int id);
  Future<AppResponse> getTopProducts();
  Future<AppResponse> getImage();
  Future<AppResponse> getImageProduct({required int id});
  Future<AppResponse> getOrders();
  Future<AppResponse> getStatistics();
  Future<AppResponse> getCategorys();
}

class ImpSellerRepositories implements SellerRepositories {
  final ApiServices api;
  ImpSellerRepositories({required this.api});

  @override
  Future<AppResponse> addProduct(
      {required String name_en,
      required String name_ar,
      required int category_id,
      int? quantity,
      int? price,
      required String description_en,
      required String description_ar}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.addProductSeller,
          method: Method.post,
          requiredToken: true,
          params: {
            "name_en": name_en,
            "name_ar": name_ar,
            "category_id": category_id,
            "quantity": quantity,
            "price": price,
            "description_en": description_en,
            "description_ar": description_ar
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data["product"]['id'];
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
          url: EndPoints.baserUrl +
              EndPoints.completeOrderSeller +
              id.toString(),
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
  Future<AppResponse> deleteImage() {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> deleteProduct({required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.deleteProduct + id.toString(),
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
  Future<AppResponse> deleteProductImage({required int id}) {
    // TODO: implement deleteProductImage
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> editProduct(
      {required String name_en,
      required String name_ar,
      required int category_id,
      int? quantity,
      int? price,
      required String description_en,
      required String description_ar,
      required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.editSeller + id.toString(),
          method: Method.put,
          requiredToken: true,
          params: {
            "name_en": name_en,
            "name_ar": name_ar,
            "category_id": category_id,
            "quantity": quantity,
            "price": price,
            "description_en": description_en,
            "description_ar": description_ar
          });
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getImage() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getImage,
          method: Method.get,
          requiredToken: true,
          params: []);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data['image_path'];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getImageProduct({required int id}) {
    // TODO: implement getImageProduct
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getOrders() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getOrdersSeller,
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
          url: EndPoints.baserUrl + EndPoints.getProductsSeller,
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
          url: EndPoints.baserUrl + EndPoints.statisticsSeller,
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = MarcketStatistics.fromJson(data);
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
          url: EndPoints.baserUrl + EndPoints.getTopProductsSeller,
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
          url: EndPoints.baserUrl + EndPoints.rejectOrderSeller + id.toString(),
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
  Future<AppResponse> uploadImage({required dio.FormData image}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.uploadImageSeller,
          method: Method.post,
          requiredToken: true,
          uploadImage: true,
          params: image);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> uploadImageProduct(
      {required dio.FormData image, required int id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url:
              EndPoints.baserUrl + EndPoints.uploadImageProduct + id.toString(),
          method: Method.post,
          requiredToken: true,
          uploadImage: true,
          params: image);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = data[ApiKey.message];
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getCategorys() async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getCategory,
          method: Method.get,
          requiredToken: false,
          params: []);
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      final listData = data['categories'] as List<dynamic>;
      response.data = listData
          .map(
            (e) => CategoryModel.fromJson(e),
          )
          .toList();
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }

  @override
  Future<AppResponse> getProduct(int id) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.getProductSeller + id.toString(),
          method: Method.get,
          requiredToken: true,
          params: {});
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = Product.fromJson(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
