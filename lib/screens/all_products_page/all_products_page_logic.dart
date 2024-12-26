import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';

class AllProductsPageController extends GetxController {
  final searchController = TextEditingController();

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
  "market_id": 1,
  "name_en": "Choko Cake",
  "name_ar": "كعكة شوكولا",
  "quantity": 1,
  "price": 10000,
  "image": "/",
  "description_en": "for birthdays",
  "description_ar": "من اجل اعياد الميلاد",
  "number_of_purchases": 1,
  "created_at": "2024-12-18T09:38:05.000000Z",
  "updated_at": "2024-12-18T12:08:03.000000Z",
  "category_en": "Food and Drinks",
  "category_ar": "أطعمة ومشروبات"
};
