import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/entities/app_statistics.dart';
import 'package:quick_delivery_admin/data/entities/marcket_statistics.dart';
import 'package:quick_delivery_admin/data/enums/app_state_enum.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/manager_model.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

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
      "updated_at": "2024-12-18T09:37:18.000000Z",
      "market_name_en": "be order",
      "market_name_ar": "بي اوردر"
    };
    final tempStat = {
      "message": "statistics get seccessfully",
      "number_of_products": 2,
      "number_of_orders": 2,
      "salary": 20000
    };
    final datatempAppStat = {
      "message": "statistics get seccessfully",
      "number_of_products": 2,
      "number_of_markets": 3,
      "number_of_orders": 2
    };

    managerCurrent = ManagerModel.fromJson(tempData);
    if (managerCurrent!.role == "seller") {
      marcketStatistics = MarcketStatistics.fromJson(tempStat);
    } else {
      appStatistics = AppStatistics.fromJson(datatempAppStat);
    }

    Get.off(HomePage(), binding: HomePageBinging());
  }
}
