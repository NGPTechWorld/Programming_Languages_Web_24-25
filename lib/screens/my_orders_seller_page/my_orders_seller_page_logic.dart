import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';

class MyOrdersSellerPageController extends GetxController {
  final searchController = TextEditingController();

  var order = <OrderModel>[
    OrderModel.fromJson(dorder),
    OrderModel.fromJson(dorder),
    OrderModel.fromJson(dorder),
    OrderModel.fromJson(dorder)
  ];
}

final dorder = {
  "id": 2,
  "products": [
    {
      "name_en": "Choko Cake",
      "name_ar": "كعكة شوكولا",
      "quantity": 2,
      "price": 10000,
      "cost": 20000
    },
    {
      "name_en": "Choko Cake",
      "name_ar": "كعكة شوكولا",
      "quantity": 2,
      "price": 10000,
      "cost": 20000
    }
  ],
  "date": "2024/12/20",
  "status_id": 1,
  "total_cost": 20000
};
