import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/repositories/users_repositories.dart';
import '../../app/services/local_storage/cache_service_getstorage.dart';
import '../../screens/start_page/start_page_logic.dart';
import '/app/services/api/dio_consumer.dart';
import '../../app/services/local_storage/cache_services_with_sharedpreferences.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CacheServiceGetStorage());
    Get.put(DioConsumer(dio: Dio()));
    Get.put(ImpUsersRepositories(api: Get.find<DioConsumer>()));
    Get.put(StartPageBinging()).dependencies();
  }

  Future<void> initializes() async {
    Get.put(CacheServicesSharedPreferences());
    await Get.find<CacheServicesSharedPreferences>().init();
  }
}
