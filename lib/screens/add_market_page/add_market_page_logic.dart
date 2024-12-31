import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/entities/Market_card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class AddMarketPageController extends GetxController {
  final market_name_en_Controller = TextEditingController();
  final name_Controller = TextEditingController();
  final market_name_ar_Controller = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmation_Controller = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final moniterMode = false.obs;
  var loadingState = LoadingState.idle.obs;
  final isVisablePass = true.obs;
  final isVisableConfPass = true.obs;
  String? imageURL;
  int? idMarket;
  Rx<String> imageName = ''.obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  final adminRepositories = Get.find<ImpAdminRepositories>();

  void fillMarket(MarketCardEntite market) {
    name_Controller.text = market.manager_name;
    market_name_en_Controller.text = market.nameEn;
    market_name_ar_Controller.text = market.nameAr;
    idMarket = market.manager_id;
    imageURL = (market.image!);
    update();
  }

  void addMarket(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.addMarket(
        name: name_Controller.text,
        market_name_en: market_name_en_Controller.text,
        market_name_ar: market_name_ar_Controller.text,
        password: passwordController.text,
        password_confirmation: password_confirmation_Controller.text);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.addedMarket.tr);
      homeController.refreshData("MyMarketssAdmin");
      calnsel();
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  void editMarket(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.editMarket(
      id: idMarket!,
      name_en: market_name_en_Controller.text,
      name_ar: market_name_ar_Controller.text,
    );
    if (response.success) {
      SnackBarCustom.show(context, StringManager.editedMarket.tr);
      homeController.refreshData("MyMarketssAdmin");
      calnsel();
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  void calnsel() {
    clearData();
    homeController.indexPageSeller.value = 1;
  }

  void clearData() {
    name_Controller.text = market_name_en_Controller.text =
        market_name_ar_Controller.text = password_confirmation_Controller.text =
            passwordController.text = "";

    imageBytes = Rx<Uint8List?>(null);
    imageBytes = Rx<Uint8List?>(null);
    update();
    imageName = ''.obs;
  }
}
