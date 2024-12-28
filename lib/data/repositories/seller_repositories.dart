import 'dart:convert';

import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/api/api_response_model.dart';
import 'package:quick_delivery_admin/app/services/api/api_services.dart';
import 'package:quick_delivery_admin/app/services/api/dio_consumer.dart';
import 'package:quick_delivery_admin/app/services/api/end_points.dart';
import 'package:quick_delivery_admin/core/errors/error_handler.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/upload_image.dart';

abstract class TestRepositories {
  Future<AppResponse> addProduct(
      {required String name_en,
      required String name_ar,
      required int category_id,
      required int quantity,
      required int price,
      required String description_en,
      required String description_ar});
  Future<AppResponse> uploadImage({required FormData image});
  Future<AppResponse> uploadImageProduct({required FormData image});
  Future<AppResponse> editProduct(
      {required String name_en,
      required String name_ar,
      required String category_id,
      required String quantity,
      required String price,
      required String description_en,
      required String description_ar});
  Future<AppResponse> completeOrder({required int id});
  Future<AppResponse> rejectOrder({required int id});
  Future<AppResponse> deleteProduct({required int id});
  Future<AppResponse> deleteProductImage({required int id});
  Future<AppResponse> deleteImage();
  Future<AppResponse> getProducts();
  Future<AppResponse> getTopProducts();
  Future<AppResponse> getImage();
  Future<AppResponse> getImageProduct({required int id});
  Future<AppResponse> getOrders();
  Future<AppResponse> getStatistics();
}

class ImpTestRepositories implements TestRepositories {
  final ApiServices api;
  ImpTestRepositories({required this.api});

  @override
  Future<AppResponse> addProduct(
      {required String name_en,
      required String name_ar,
      required int category_id,
      required int quantity,
      required int price,
      required String description_en,
      required String description_ar}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
          url: EndPoints.baserUrl + EndPoints.addProductSeller,
          method: Method.post,
          requiredToken: true,
          params: {
            {
              "name_en": name_en,
              "name_ar": name_ar,
              "category_id": category_id,
              "quantity": quantity,
              "price": price,
              "description_en": description_en,
              "description_ar": description_ar
            }
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
  Future<AppResponse> completeOrder({required int id}) {
    // TODO: implement completeOrder
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> deleteImage() {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> deleteProduct({required int id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> deleteProductImage({required int id}) {
    // TODO: implement deleteProductImage
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> editProduct({required String name_en, required String name_ar, required String category_id, required String quantity, required String price, required String description_en, required String description_ar}) {
    // TODO: implement editProduct
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getImage() {
    // TODO: implement getImage
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> getImageProduct({required int id}) {
    // TODO: implement getImageProduct
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
  
  @override
  Future<AppResponse> uploadImage({required FormData image}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
  
  @override
  Future<AppResponse> uploadImageProduct({required FormData image}) {
    // TODO: implement uploadImageProduct
    throw UnimplementedError();
  }
}
