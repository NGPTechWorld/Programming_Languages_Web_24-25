import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/entities/login_entitie.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/manager_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/helper_widget.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/start_page/start_page.dart';
import 'package:quick_delivery_admin/screens/start_page/start_page_logic.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}

class LoginPageController extends GetxController {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final managerRepositories = Get.find<ImpTManagerRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  final isVisablePass = true.obs;

  login(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await managerRepositories.login(
        name: nameController.text, password: passwordController.text);
    if (response.success) {
      final data = response.data as LoginEntitie;
      final saveState = await cache.saveData(kUserTokenKey, data.bearerToken);
      if (saveState) {
        SnackBarCustom.show(context, StringManager.loginSuccess.tr);
        loadingState.value = LoadingState.doneWithData;
        Get.offAll(() => StartPage(), binding: StartPageBinging());
      }
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  languageOnTap() {
    HelperWidget.languageDialgo();
  }
}
