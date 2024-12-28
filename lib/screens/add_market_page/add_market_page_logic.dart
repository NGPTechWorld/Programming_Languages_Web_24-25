import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:quick_delivery_admin/data/entities/Market_card_entite.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class AddMarketPageController extends GetxController {
  final market_name_en_Controller = TextEditingController();
  final name_Controller = TextEditingController();
  final market_name_ar_Controller = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmation_Controller = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final moniterMode = false.obs;

  final isVisablePass = true.obs;
  final isVisableConfPass = true.obs;
  Rx<String> imageSelectedPath = ''.obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  Future<void> pickImage() async {
    final file = await ImagePickerWeb.getImageAsBytes();
    if (file != null) {
      imageBytes.value = file;
      imageSelectedPath.value = '';
    }
  }

  void fillMarket(MarketCardEntite market) {
    name_Controller.text = market.manager_name;
    market_name_en_Controller.text = market.nameEn;
    market_name_ar_Controller.text = market.nameAr;
  }

  void addMarket() {}

  void calnsel() {
    clearData();
    homeController.indexPageSeller.value = 1;
  }

  void clearData() {
    name_Controller.text = market_name_en_Controller.text =
        market_name_ar_Controller.text = password_confirmation_Controller.text =
            passwordController.text = "";

    imageBytes = Rx<Uint8List?>(null);
    imageSelectedPath = ''.obs;
  }
}
