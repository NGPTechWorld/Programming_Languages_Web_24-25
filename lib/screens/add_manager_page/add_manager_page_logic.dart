import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class AddManagerPageController extends GetxController {
  final name_Controller = TextEditingController();
  final passwordController = TextEditingController();
  final password_confirmation_Controller = TextEditingController();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  final moniterMode = false.obs;
  final homeController = Get.find<HomePageController>();
  var loadingState = LoadingState.idle.obs;
  final isVisablePass = true.obs;
  final isVisableConfPass = true.obs;

  void addManager(BuildContext context) async{
    loadingState.value = LoadingState.loading;
    final response = await adminRepositories.addAdmin(
        name: name_Controller.text,
        password: passwordController.text,
        password_confirmation: password_confirmation_Controller.text);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.addedMaanger.tr);
      homeController.refreshData("MyManagersAdmin");
      calnsel();
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  void calnsel() {
    clearData();
    homeController.indexPageSeller.value = 2;
  }

  void clearData() {
    name_Controller.text =
        password_confirmation_Controller.text = passwordController.text = "";
  }
}
