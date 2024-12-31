import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/manager_card_entitie.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/screens/add_manager_page/add_manager_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyManagersAdminPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  final managersController = Get.find<AddManagerPageController>();
  var loadingState = LoadingState.idle.obs;
  var managers = <ManagerCardEntitie>[].obs;

  addManager() {
     managersController.moniterMode.value = false;
    homeController.indexPageSeller.value = 6;
  }
  getManages()async{
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.getAdmins();
    if (response.success) {
      final list = response.data as List<ManagerCardEntitie>;
      managers.value = list.reversed.toList();
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }
  void delete(ManagerCardEntitie manager) {}
}


