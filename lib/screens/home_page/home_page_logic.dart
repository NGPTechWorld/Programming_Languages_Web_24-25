import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/helper_widget.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/my_orders_seller_page.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/my_orders_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_product_seller_page/my_product_seller_page.dart';
import 'package:quick_delivery_admin/screens/my_product_seller_page/my_product_seller_page_logic.dart';

class HomePageBinging extends Bindings {
  @override
  void dependencies() {
    if (managerCurrent!.role == "seller") {
      Get.lazyPut(() => AddProductPageController());
      Get.lazyPut(() => MyProductSellerPageController());
      Get.lazyPut(() => (MyOrdersSellerPageController()));
      Get.lazyPut(() => (DashboardSellerPageController()));
    } else {}

    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  final indexPageSeller = 0.obs;
  List<Widget> pages = [];

  fetchPages() {
    if (managerCurrent!.role == "seller") {
      pages.addAll([
        DashboardSellerPage(),
        MyProductSellerPage(),
        MyOrdersSellerPage(),
        SupPage(
          color: ColorManager.blackColor,
        ),
        AddProductPage(),
      ]);
    } else {
      pages.addAll([
        SupPage(
          color: ColorManager.blackColor,
        ),
        SupPage(
          color: ColorManager.blackColor,
        ),
        SupPage(
          color: ColorManager.blackColor,
        ),
      ]);
    }
  }

  languageOnTap() {
    HelperWidget.languageDialgo();
  }

  gotToPage(int indexPage) {
    Get.lazyPut(() => AddProductPageController());
    final productController = Get.find<AddProductPageController>();
    productController.clearData();
    indexPageSeller.value = indexPage;
  }
}
