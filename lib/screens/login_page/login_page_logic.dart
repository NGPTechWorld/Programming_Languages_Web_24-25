import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/entities/login_entitie.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/users_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/helper_widget.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}

class LoginPageController extends GetxController {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthRepositories = Get.find<ImpUsersRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  final isVisablePass = true.obs;

  login(BuildContext context) async {
    loadingState.value = LoadingState.loading;
    final response = await AuthRepositories.login(
        number: nameController.text, password: passwordController.text);
    if (response.success) {
      final data = response.data as LoginEntitie;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  languageOnTap() {
    HelperWidget.languageDialgo();
  }
}
