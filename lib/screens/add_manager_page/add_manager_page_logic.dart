import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class AddManagerPageController extends GetxController {
  final name_Controller = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmation_Controller = TextEditingController();

  final homeController = Get.find<HomePageController>();
  var loadingState = LoadingState.idle.obs;
  final isVisablePass = true.obs;
  final isVisableConfPass = true.obs;

  void addManager() {}

  void calnsel() {
    clearData();
    homeController.indexPageSeller.value = 2;
  }

  void clearData() {
    name_Controller.text =
        password_confirmation_Controller.text = passwordController.text = "";
  }
}
