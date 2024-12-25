import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/assets_manager.dart';
import 'package:quick_delivery_admin/app/services/api/end_points.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyProductPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final productController = Get.find<AddProductPageController>();
  var products = <ProductsCardEntite>[
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
    ProductsCardEntite(
        id: 1,
        name: 'Choko Cake',
        price: 5000,
        image: AssetsManager.appIcon,
        category: "category"),
  ];

  void addProduct() {
    productController.moniterMode.value = false;
    homeController.indexPageSeller.value = 2;
  }

  void showProduct() {
    final data = {
      "id": 3,
      "market_id": 3,
      "name_en": "Organic Apples",
      "name_ar": "تفاح عضوي",
      "quantity": 50,
      "price": 300,
      "image": "http://192.168.1.6:8000/storage/https://example.com/apples.jpg",
      "description_en": "Fresh and organic",
      "description_ar": "طازج وعضوي",
      "number_of_purchases": 10,
      "created_at": "2024-12-23T16:59:21.000000Z",
      "updated_at": "2024-12-23T16:59:21.000000Z",
      "category_en": "Food and Drinks",
      "category_ar": "أطعمة ومشروبات"
    };

    productController.fillProduct(Product.fromJson(data));
    productController.myproduct = Product.fromJson(data);
    productController.moniterMode.value = true;
    homeController.indexPageSeller.value = 2;
  }
}

class ProductsCardEntite {
  final String name;
  final String image;
  final int id;
  final String category;
  final int price;

  ProductsCardEntite({
    required this.name,
    required this.image,
    required this.id,
    required this.category,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ApiKey.name: name,
      ApiKey.image: image,
      ApiKey.id: id,
      ApiKey.category: category,
      ApiKey.price: price,
    };
  }

  factory ProductsCardEntite.fromMap(Map<String, dynamic> map) {
    return ProductsCardEntite(
      name: map[ApiKey.name] as String,
      image: (map[ApiKey.image] as String?) ?? "",
      id: map[ApiKey.id] as int,
      category: map[ApiKey.category] as String,
      price: map[ApiKey.price] as int,
    );
  }

  String toJson() => json.encode(toMap());
}
