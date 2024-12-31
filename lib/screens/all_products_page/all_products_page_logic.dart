import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';

class AllProductsPageController extends GetxController {
  final searchController = TextEditingController();
final adminRepositories = Get.find<ImpAdminRepositories>();
  var loadingState = LoadingState.idle.obs;
  var products = <ProductsCardEntite>[].obs;

  getAllProducts() async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.getProducts();
    if (response.success) {
      products.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
}

final dataProductTemp = {
  "id": 1,
  "name_en": "Choko Cake",
  "name_ar": "كعكة شوكولا",
  "quantity": 1,
  "price": 10000,
  "image": "null",
  "description_en": "for birthdays",
  "description_ar": "من اجل اعياد الميلاد",
  "number_of_purchases": 1,
  "created_at": "2024-12-18T09:38:05.000000Z",
  "updated_at": "2024-12-18T12:08:03.000000Z",
  "market_name_en": "be order",
  "market_name_ar": "بي اوردر",
  "category_en": "Food and Drinks",
  "category_ar": "أطعمة ومشروبات"
};
