import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart'; 

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

  void saveProduct() {
    String nameEN = nameENController.text;
    String nameAR = nameARController.text;
    String descEN = descENController.text;
    String descAR = descARController.text;
    String price = priceController.text;
    String quantity = quantityController.text;
    int categoryId = selectedCategory.value;

  }
}
