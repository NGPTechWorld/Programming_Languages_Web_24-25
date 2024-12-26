import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/enums/app_state_enum.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/manager_model.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/login_page/login_page.dart';
import 'package:quick_delivery_admin/screens/login_page/login_page_logic.dart';

class StartPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(StartPageController());
  }
}

class StartPageController extends GetxController {
  final isConnectedPage = true.obs;
  //final AuthRepositories = Get.find<ImpUsersRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;

  startApp() {
    // if (await cache.getUserToken() == null) {
    //   //Get.off(LoginPage(), binding: LoginPageBinding());

    // } else {}
    //TODO: Get Manager info
    final tempData = {
      "id": 2,
      "name": "Harry Potter",
      "role": "seller",
      "created_at": "2024-12-18T09:37:18.000000Z",
      "updated_at": "2024-12-18T09:37:18.000000Z"
    };
    managerCurrent = ManagerModel.fromJson(tempData);
    Get.off(HomePage(), binding: HomePageBinging());
  }
}
