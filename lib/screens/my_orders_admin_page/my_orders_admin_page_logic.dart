import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';

class MyOrdersAdminPageController extends GetxController {
  final searchController = TextEditingController();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  var loadingState = LoadingState.idle.obs;
  var orders = <OrderModel>[].obs;

  getOrders() async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.getOrders();
    if (response.success) {
      final list = response.data as List<OrderModel>;
      orders.value = list.reversed.toList();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  rejectOrder(OrderModel mYrder, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.rejectOrder(id: mYrder.id);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.rejectOrder.tr);
      getOrders();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  deliverOrder(OrderModel mYrder, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.deliverOrder(id: mYrder.id);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.deliverOrder.tr);
      getOrders();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  completeOrder(OrderModel mYrder, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.completeOrder(id: mYrder.id);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.completeOrder.tr);
      getOrders();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
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
