import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/services/local_storage/cache_services_with_sharedpreferences.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/enums/app_state_enum.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/data/repositories/manager_repositories.dart';
import 'package:quick_delivery_admin/data/repositories/seller_repositories.dart';
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
  final managerRepositories = Get.find<ImpManagerRepositories>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  final sellerRepositories = Get.find<ImpSellerRepositories>();
  final cache = Get.find<CacheServicesSharedPreferences>();
  var loadingState = LoadingState.idle.obs;
  var appState = AppState.run.obs;

  startApp() async {
    if (await cache.getUserToken() == null) {
      Get.off(LoginPage(), binding: LoginPageBinding());
    } else {
      await currentManager();
      if (managerCurrent!.role == "seller") {
        await getStatisticsSeller();
      } else {
        await getStatisticsAdmin();
      }

      Get.off(HomePage(), binding: HomePageBinging());
    }
  }

  currentManager() async {
    final response = await managerRepositories.currentManager();
    if (response.success) {
      managerCurrent = response.data;
    } else {
      if (response.networkFailure!.code == 401) {
        cache.clearData();
        Get.off(LoginPage(), binding: LoginPageBinding());
      }
    }
  }

  getStatisticsAdmin() async {
    final response = await adminRepositories.getStatistics();
    if (response.success) {
      appStatistics = response.data;
    } else {
      if (response.networkFailure!.code == 401) {
        cache.clearData();
        Get.off(LoginPage(), binding: LoginPageBinding());
      }
    }
  }

  getStatisticsSeller() async {
    final response = await sellerRepositories.getStatistics();
    if (response.success) {
      marcketStatistics = response.data;
    } else {
      if (response.networkFailure!.code == 401) {
        cache.clearData();
        Get.off(LoginPage(), binding: LoginPageBinding());
      }
    }
  }
}
