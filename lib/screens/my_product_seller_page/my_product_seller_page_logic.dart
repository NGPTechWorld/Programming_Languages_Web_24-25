import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';
import 'package:quick_delivery_admin/data/repositories/seller_repositories.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyProductSellerPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final productController = Get.find<AddProductPageController>();
  final sellerRepositories = Get.find<ImpSellerRepositories>();
  var loadingState = LoadingState.idle.obs;
  var products = <ProductsCardEntite>[].obs;

  void addProduct() {
    productController.moniterMode.value = false;
    homeController.indexPageSeller.value = 3;
  }

  getProducts() async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.getProducts();
    if (response.success) {
      products.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  delete(ProductsCardEntite product, BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.deleteProduct(id: product.id);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.deletedProduct.tr);
      getProducts();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  showProduct(ProductsCardEntite product) {
    productController.fillProduct((product));
    productController.myproduct = (product);
    productController.moniterMode.value = true;
    homeController.indexPageSeller.value = 3;
  }
}
