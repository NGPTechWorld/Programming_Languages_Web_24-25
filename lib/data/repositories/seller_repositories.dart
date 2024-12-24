import 'dart:convert';

import 'package:quick_delivery_admin/app/services/api/api_response_model.dart';
import 'package:quick_delivery_admin/app/services/api/api_services.dart';
import 'package:quick_delivery_admin/app/services/api/dio_consumer.dart';
import 'package:quick_delivery_admin/app/services/api/end_points.dart';
import 'package:quick_delivery_admin/core/errors/error_handler.dart';

abstract class TestRepositories {
  Future<AppResponse> addProductSeller(
      {required String name_en,
      required String name_ar,
      required int category_id,
      required int quantity,
      required int price,
      required String description_en,
      required String description_ar});
  Future<AppResponse> test({required String test});
}

class ImpTestRepositories implements TestRepositories {
  final ApiServices api;
  ImpTestRepositories({required this.api});

  @override
  Future<AppResponse> test({required String test}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> addProductSeller(
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
}
