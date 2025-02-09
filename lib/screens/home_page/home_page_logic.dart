
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/manager_model.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/data/repositories/manager_repositories.dart';
import 'package:quick_delivery_admin/screens/add_manager_page/add_manager_page.dart';
import 'package:quick_delivery_admin/screens/add_manager_page/add_manager_page_logic.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/all_products_market_page/all_products_market_page.dart';
import 'package:quick_delivery_admin/screens/all_products_market_page/all_products_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/all_products_page/all_products_page.dart';
import 'package:quick_delivery_admin/screens/all_products_page/all_products_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/helper_widget.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/show_loading_dialog.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/dashboard_admin_page/dashboard_admin_page.dart';
import 'package:quick_delivery_admin/screens/dashboard_admin_page/dashboard_admin_page_logic.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_managers_admin_page/my_managers_admin_page.dart';
import 'package:quick_delivery_admin/screens/my_managers_admin_page/my_managers_admin_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_market_page/my_market_page.dart';
import 'package:quick_delivery_admin/screens/my_market_page/my_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_orders_admin_page/my_orders_admin_page.dart';
import 'package:quick_delivery_admin/screens/my_orders_admin_page/my_orders_admin_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/my_orders_seller_page.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/my_orders_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_product_seller_page/my_product_seller_page.dart';
import 'package:quick_delivery_admin/screens/my_product_seller_page/my_product_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/start_page/start_page.dart';
import 'package:quick_delivery_admin/screens/start_page/start_page_logic.dart';

class HomePageBinging extends Bindings {
  @override
  void dependencies() {
    if (managerCurrent!.role == "seller") {
      Get.lazyPut(() => AddProductPageController());
      Get.lazyPut(() => MyProductSellerPageController());
      Get.lazyPut(() => (MyOrdersSellerPageController()));
      Get.lazyPut(() => (DashboardSellerPageController()));
    } else {
      Get.lazyPut(() => (DashboardAdminPageController()));
      Get.lazyPut(() => (MyMarketPageController()));
      Get.lazyPut(() => (MyManagersAdminPageController()));
      Get.lazyPut(() => (AllProductsPageController()));
      Get.lazyPut(() => (MyOrdersAdminPageController()));
      Get.lazyPut(() => (AddMarketPageController()));
      Get.lazyPut(() => (AddManagerPageController()));
      Get.lazyPut(() => (AllProductsMarketPageController()));
    }

    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  final indexPageSeller = 0.obs;
  List<Widget> pages = [];
  final managerRepositories = Get.find<ImpManagerRepositories>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  fetchPages() {
    if (managerCurrent!.role == "seller") {
      pages.addAll([
        DashboardSellerPage(),
        MyProductSellerPage(),
        MyOrdersSellerPage(),
        AddProductPage(),
      ]);
    } else {
      pages.addAll([
        DashboardAdminPage(),
        MyMarketPage(),
        MyManagersAdminPage(),
        AllProductsPage(),
        MyOrdersAdminPage(),
        AddMarketPage(),
        AddManagerPage(),
        AllProductsMarketPage()
      ]);
    }
  }

  languageOnTap() {
    HelperWidget.languageDialgo();
  }

  refreshData(String tupe) {
    switch (tupe) {
      case "MyProductSeller":
        final controller = Get.find<MyProductSellerPageController>();
        controller.getProducts();
        break;
      case "DashboardSeller":
        final controller = Get.find<DashboardSellerPageController>();
        controller.getTopProducts();
        controller.getStatisticsSeller();
        controller.getImage();
        break;
      case "MyOrderdsSeller":
        final controller = Get.find<MyOrdersSellerPageController>();
        controller.getOrders();
        break;
      //
      case "DashboardAdmin":
        final controller = Get.find<DashboardAdminPageController>();
        controller.getTopProducts();
        controller.getStatisticsAdmin();
        break;
      case "MyMarketssAdmin":
        final controller = Get.find<MyMarketPageController>();
        controller.getMarket();
        break;
      case "AllProductsAdmin":
        final controller = Get.find<AllProductsPageController>();
        controller.getAllProducts();
        break;
      case "MyOrdersAdmin":
        final controller = Get.find<MyOrdersAdminPageController>();
        controller.getOrders();
        break;
      case "MyManagersAdmin":
        final controller = Get.find<MyManagersAdminPageController>();
        controller.getManages();
        break;
    }
  }

  gotToPage(int indexPage) {
    if (managerCurrent!.role == "seller") {
      Get.lazyPut(() => AddProductPageController());
      final productController = Get.find<AddProductPageController>();
      productController.clearData();
    } else {
      Get.lazyPut(() => AddMarketPageController());
      final marketController = Get.find<AddMarketPageController>();
      marketController.clearData();
    }

    indexPageSeller.value = indexPage;
  }

  logout(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    showLoadingDialog(context);
    final response = await managerRepositories.logout();
    if (response.success) {
      cache.clearData();
      SnackBarCustom.show(context, response.data.toString());
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
    Get.offAll(StartPage(), binding: StartPageBinging());
  }

  currentManager() async {
    final response = await managerRepositories.currentManager();
    if (response.success) {
      managerCurrent = response.data as ManagerModel;
      loadingState = LoadingState.doneWithData.obs;
    } else {
      loadingState = LoadingState.hasError.obs;
    }
  }
}
