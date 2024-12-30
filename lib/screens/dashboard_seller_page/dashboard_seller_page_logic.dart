
import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/repositories/admin_repositories.dart';
import 'package:quick_delivery_admin/data/repositories/seller_repositories.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class DashboardSellerPageController extends GetxController {
  final homeController = Get.find<HomePageController>();
  final sellerRepositories = Get.find<ImpSellerRepositories>();
  final adminRepositories = Get.find<ImpAdminRepositories>();
  var loadingState = LoadingState.idle.obs;
  var products = <ProductsCardEntite>[].obs;

  getTopProducts() async {
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.getTopProducts();
    if (response.success) {
      products.value = response.data;
    } else {
      loadingState.value = LoadingState.hasError;
    }
  }

  getStatisticsAdmin() async {
    final response = await sellerRepositories.getStatistics();
    if (response.success) {
      marcketStatistics = response.data;
      update();
    } else {}
  }
}

final dataProductTemp = {
  "id": 1,
  "market_id": 1,
  "name_en": "Choko Cake",
  "name_ar": "كعكة شوكولا",
  "quantity": 1,
  "price": 10000,
  "image": "ss/s",
  "description_en": "for birthdays",
  "description_ar": "من اجل اعياد الميلاد",
  "number_of_purchases": 1,
  "created_at": "2024-12-18T09:38:05.000000Z",
  "updated_at": "2024-12-18T12:08:03.000000Z",
  "category_en": "Food and Drinks",
  "category_ar": "أطعمة ومشروبات"
};

final datatempStat = {
  "message": "statistics get successfully",
  "number_of_products": 2,
  "number_of_orders": 1,
  "salary": 20000
};
