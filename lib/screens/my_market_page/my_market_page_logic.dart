import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/entities/Market_card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/all_products_market_page/all_products_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyMarketPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final marketController = Get.find<AddMarketPageController>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  var loadingState = LoadingState.idle.obs;
  final marketProductController = Get.find<AllProductsMarketPageController>();
  var markets = <MarketCardEntite>[].obs;

  addMarket() {
    marketController.moniterMode.value = false;
    homeController.indexPageSeller.value = 5;
  }

  goToMarket(MarketCardEntite market) {
    //TODO:  marketProductController.products = API
    homeController.indexPageSeller.value = 7;
  }

  void showProduct(MarketCardEntite market) {
    marketController.fillMarket(market);
    marketController.moniterMode.value = true;
    homeController.indexPageSeller.value = 5;
  }

  getMarket() async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.getMarket();
    if (response.success) {
      markets.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  delete(MarketCardEntite market, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.deleteMarket(id: market.id);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.deletetMarket.tr);
      getMarket();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
}

final dataMarketTemp = {
  "id": 1,
  "name_en": "be order",
  "name_ar": "بي اوردرنةتت ختختتختخ تتختت",
  "image": "",
  "manager_id": 2,
  "created_at": "2024-12-18T09:37:18.000000Z",
  "updated_at": "2024-12-18T09:37:18.000000Z",
  "manager_name": "Harry Potter"
};
