import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/data/repositories/seller_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:dio/dio.dart' as Dio;

class DashboardSellerPageController extends GetxController {
  final homeController = Get.find<HomePageController>();
  final sellerRepositories = Get.find<ImpSellerRepositories>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  var loadingState = LoadingState.idle.obs;
  var products = <ProductsCardEntite>[].obs;
  String? marketImage;
  String? imageURL;
  Rx<String> imageName = ''.obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  getTopProducts() async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.getTopProducts();
    if (response.success) {
      products.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  getStatisticsSeller() async {
    final response = await sellerRepositories.getStatistics();
    if (response.success) {
      marcketStatistics = response.data;
      update();
    } else {}
  }

  Future<void> pickImage(BuildContext context) async {
    try {
      final Uint8List? selectedImage = await ImagePickerWeb.getImageAsBytes();
      if (selectedImage != null) {
        imageBytes.value = selectedImage;
        imageName.value = "${managerCurrent!.market_name_en}";
        await uploadImage(context);
        await getImage();
        update();
      } else {}
    } catch (e) {}
  }

  uploadImage(BuildContext context) async {
    Dio.MultipartFile imageFile = Dio.MultipartFile.fromBytes(
      imageBytes.value!,
      filename: imageName.value,
    );
    Dio.FormData formData = Dio.FormData.fromMap({
      "image": imageFile,
    });
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.uploadImage(
      image: formData,
    );
    if (response.success) {
      SnackBarCustom.show(context, StringManager.UpdatedImageSeller.tr);
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  getImage() async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.getImage();
    if (response.success) {
      print(response.data);
      marketImage = response.data;
      update();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
}
