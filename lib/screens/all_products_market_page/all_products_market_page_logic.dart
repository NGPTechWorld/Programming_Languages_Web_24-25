import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class AllProductsMarketPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();

  back() {
    homeController.indexPageSeller.value = 1;
  }

  var products = <ProductsCardEntite>[
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
  ];
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
