import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page.dart';

class HomePageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(AddProductPageController());
    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  final indexPageSeller = 0.obs;
  List<Widget> pagesSeller = [
    SupPage(
      color: ColorManager.whiteColor,
    ),
    AddProductPage(),
    SupPage(
      color: ColorManager.blackColor,
    ),
  ];
}
