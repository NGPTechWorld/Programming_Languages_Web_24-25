import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';

class MyOrdersAdminPageController extends GetxController {
  final searchController = TextEditingController();

  var order = <OrderModel>[
    OrderModel.fromJson(dorder),
    OrderModel.fromJson(dorder),
    OrderModel.fromJson(dorder),
    OrderModel.fromJson(dorder)
  ];
}

final dorder = {
  "id": 1,
  "date": "2024/12/20",
  "status_id": 1,
  "total_cost": 20000,
  "products": [
    {
      "name_en": "Choko Cake",
      "name_ar": "كعكة شوكولا محمد علي يحب ",
      "market_name_en": "be order",
      "market_name_ar": "بي اوردر",
      "quantity": 2,
      "price": 10000,
      "cost": 20000
    },
    {
      "name_en": "Choko Cake",
      "name_ar": "كعكة شوكولا",
      "market_name_en": "be order",
      "market_name_ar": "بي اوردر",
      "quantity": 2,
      "price": 10000,
      "cost": 20000
    },
    {
      "name_en": "Choko Cake",
      "name_ar": "كعكة شوكولا",
      "market_name_en": "be order",
      "market_name_ar": "بي اوردر",
      "quantity": 2,
      "price": 10000,
      "cost": 20000
    }
  ]
};
