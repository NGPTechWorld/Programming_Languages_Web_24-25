import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/manager_card_entitie.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class MyManagersAdminPageController extends GetxController {
  final searchController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  var managers = <ManagerCardEntitie>[
    ManagerCardEntitie.fromJson(jsonManager),
    ManagerCardEntitie.fromJson(jsonManager),
    ManagerCardEntitie.fromJson(jsonManager),
  ];

  addManager() {
    homeController.indexPageSeller.value = 6;
  }

  void delete(ManagerCardEntitie manager) {}
}

final jsonManager = {"id": 1, "name": "amdin"};
