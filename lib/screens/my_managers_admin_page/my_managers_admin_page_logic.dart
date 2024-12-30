import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/manager_card_entitie.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyManagersAdminPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  var loadingState = LoadingState.idle.obs;
  var managers = <ManagerCardEntitie>[].obs;

  addManager() {
    homeController.indexPageSeller.value = 6;
  }
  getManages()async{
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.getMarket();
    if (response.success) {
      //products.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
  void delete(ManagerCardEntitie manager) {}
}

final jsonManager = {"id": 1, "name": "amdin"};
