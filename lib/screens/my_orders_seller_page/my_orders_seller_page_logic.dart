import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';
import 'package:quick_delivery_admin/data/repositories/seller_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';

class MyOrdersSellerPageController extends GetxController {
  final searchController = TextEditingController();
  final sellerRepositories = Get.find<ImpSellerRepositories>();
  var loadingState = LoadingState.idle.obs;
  var orders = <OrderModel>[].obs;

  getOrders() async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.getOrders();
    if (response.success) {
      orders.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  rejectOrder(OrderModel mYrder,BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.rejectOrder(id: mYrder.id);
    if (response.success) {
       SnackBarCustom.show(context, StringManager.rejectOrder.tr);
      getOrders();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  completeOrder(OrderModel mYrder,BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.completeOrder(id: mYrder.id);
    if (response.success) {
       SnackBarCustom.show(context, StringManager.completeOrder.tr);
      getOrders();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
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
    }
  ],
  "date": "2024/12/20",
  "status_id": 1,
  "total_cost": 20000
};
final dorder2 = {
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
  "status_id": 2,
  "total_cost": 20000
};
