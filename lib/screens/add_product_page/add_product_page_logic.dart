import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';

class AddProductPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddProductPageController());
  }
}

class AddProductPageController extends GetxController {
  final nameARController = TextEditingController();
  final nameENController = TextEditingController();
  final descARController = TextEditingController();
  final descENController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final homeController = Get.find<HomePageController>();
  final moniterMode = false.obs;
  Product? myproduct;
  RxInt selectedCategory = 1.obs;
  Rx<String> imageSelectedPath = ''.obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  var categories = [
    {'id': 1, 'name': 'Category 1'},
    {'id': 2, 'name': 'Category 2'},
    {'id': 3, 'name': 'Category 3'},
  ];

  Future<void> pickImage() async {
    final file = await ImagePickerWeb.getImageAsBytes();
    if (file != null) {
      imageBytes.value = file;
      imageSelectedPath.value = '';
    }
  }

  void fillProduct(Product product) {
    nameENController.text = product.nameEn;
    nameARController.text = product.nameAr;
    descENController.text = product.descriptionEn;
    descARController.text = product.descriptionAr;
    priceController.text = product.price.toString();
    quantityController.text = product.quantity.toString();

    //selectedCategory.
  }

  void saveProduct() {

  }

  void calnsel() {
    clearData();
    homeController.indexPageSeller.value = 1;
  }

  void clearData() {
    nameENController.text = nameARController.text = descENController.text =
        descARController.text =
            priceController.text = quantityController.text = "";
    selectedCategory.value = 1;
    imageBytes = Rx<Uint8List?>(null);
    imageSelectedPath = ''.obs;
  }
}
