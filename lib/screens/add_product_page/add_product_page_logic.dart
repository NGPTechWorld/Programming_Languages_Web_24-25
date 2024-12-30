import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/data/enums/loading_state_enum.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';
import 'package:quick_delivery_admin/data/repositories/seller_repositories.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/snack_bar_error.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_product_seller_page/my_product_seller_page_logic.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

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
  int? idProduct;
  //final myProductController = Get.find<MyProductSellerPageController>();
  final sellerRepositories = Get.find<ImpSellerRepositories>();
  var loadingState = LoadingState.idle.obs;
  final moniterMode = false.obs;
  ProductsCardEntite? myproduct;
  RxInt selectedCategory = 1.obs;
  Rx<String> imageSelectedPath = ''.obs;
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  var categories = [
    {'id': 1, 'name': 'Category 1'},
    {'id': 2, 'name': 'Category 2'},
    {'id': 3, 'name': 'Category 3'},
  ];

  Future<void> pickImage() async {
    try {
      // فتح نافذة اختيار الصورة
      Uint8List? selectedImage = await ImagePickerWeb.getImageAsBytes();

      if (selectedImage != null) {
        imageBytes.value = selectedImage;
        imageSelectedPath.value = 'SelectedImage.png';
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void fillProduct(ProductsCardEntite product) {
    nameENController.text = product.nameEn;
    nameARController.text = product.nameAr;
    descENController.text = product.descriptionEn;
    descARController.text = product.descriptionAr;
    priceController.text = product.price.toString();
    quantityController.text = product.quantity.toString();
    idProduct = product.id;
    //selectedCategory.
  }

  addProduct(BuildContext context) async {
    if (imageBytes == null) {
      SnackBarCustom.show(context, StringManager.UploadProductImage.tr);
      return;
    }
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.addProduct(
        name_en: nameENController.text,
        name_ar: nameARController.text,
        category_id: selectedCategory.value,
        quantity: quantityController.text == ""
            ? null
            : int.parse(quantityController.text),
        price:
            priceController.text == "" ? null : int.parse(priceController.text),
        description_en: descENController.text,
        description_ar: descARController.text);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.addedProduct.tr);
      // myProductController.getProducts(context);
      //uploadImage(response.data);
      homeController.refreshData("MyProductSeller");
      calnsel();
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  editProduct(BuildContext context) async {
    if (imageBytes == null) {
      SnackBarCustom.show(context, StringManager.UploadProductImage.tr);
      return;
    }
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.editProduct(
        name_en: nameENController.text,
        name_ar: nameARController.text,
        category_id: selectedCategory.value,
        quantity: quantityController.text == ""
            ? null
            : int.parse(quantityController.text),
        price:
            priceController.text == "" ? null : int.parse(priceController.text),
        description_en: descENController.text,
        description_ar: descARController.text,
        id: idProduct!);
    if (response.success) {
      SnackBarCustom.show(context, StringManager.editedProduct.tr);
      // myProductController.getProducts(context);
      //uploadImage(response.data);
      homeController.refreshData("MyProductSeller");
      calnsel();
      loadingState.value = LoadingState.doneWithData;
    } else {
      SnackBarCustom.show(context, response.networkFailure!.message);
      loadingState.value = LoadingState.hasError;
    }
  }

  void calnsel() {
    clearData();
    homeController.indexPageSeller.value = 1;
  }

  uploadImage(int id) async {
    String fileName = imageSelectedPath.value.split('/').last;
    Dio.FormData formData = Dio.FormData.fromMap({
      "image": await Dio.MultipartFile.fromFile(
        imageSelectedPath.value,
        filename: fileName,
      ),
    });
    loadingState.value = LoadingState.loading;
    final response = await sellerRepositories.uploadImageProduct(
      id: id,
      image: formData,
    );
    if (response.success) {
    } else {
      loadingState.value = LoadingState.hasError;
    }
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
