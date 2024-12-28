import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class DashboardAdminPageController extends GetxController {
  final homeController = Get.find<HomePageController>();

  var products = <ProductsCardEntite>[
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
  ];
}

final dataProductTemp = {
  "id": 1,
  "name_en": "Choko Cake",
  "name_ar": "كعكة شوكولا",
  "quantity": 1,
  "price": 10000,
  "image": "null",
  "description_en": "for birthdays",
  "description_ar": "من اجل اعياد الميلاد",
  "number_of_purchases": 1,
  "created_at": "2024-12-18T09:38:05.000000Z",
  "updated_at": "2024-12-18T12:08:03.000000Z",
  "market_name_en": "be order",
  "market_name_ar": "بي اوردر",
  "category_en": "Food and Drinks",
  "category_ar": "أطعمة ومشروبات"
};

final datatempAppStat = {
  "message": "statistics get seccessfully",
  "number_of_products": 2,
  "number_of_markets": 3,
  "number_of_orders": 2
};
