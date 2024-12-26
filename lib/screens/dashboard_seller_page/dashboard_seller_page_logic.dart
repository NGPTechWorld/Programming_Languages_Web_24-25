import 'package:get/get.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class DashboardSellerPageController extends GetxController {
  final homeController = Get.find<HomePageController>();
  final productController = Get.find<AddProductPageController>();
  var products = <ProductsCardEntite>[
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
    ProductsCardEntite.fromJson(dataProductTemp),
  ];
 
  void showProduct() {
    final data = {
      "id": 3,
      "market_id": 3,
      "name_en": "Organic Apples",
      "name_ar": "تفاح عضوي",
      "quantity": 50,
      "price": 300,
      "image": "http://192.168.1.6:8000/storage/https://example.com/apples.jpg",
      "description_en": "Fresh and organic",
      "description_ar": "طازج وعضوي",
      "number_of_purchases": 10,
      "created_at": "2024-12-23T16:59:21.000000Z",
      "updated_at": "2024-12-23T16:59:21.000000Z",
      "category_en": "Food and Drinks",
      "category_ar": "أطعمة ومشروبات"
    };

    productController.fillProduct(Product.fromJson(data));
    productController.myproduct = Product.fromJson(data);
    productController.moniterMode.value = true;
    homeController.indexPageSeller.value = 4;
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
