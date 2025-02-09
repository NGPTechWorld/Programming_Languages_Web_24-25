import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/bottom_show_product.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/input_desrp_product.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/input_detail_product.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/upload_image.dart';

class AddProductPage extends GetView<AddProductPageController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCategorys();
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.moniterMode.value
                ? StringManager.EditProduct.tr
                : StringManager.AddProduct.tr,
            style: StyleManager.h2_Bold(),
          ),
        ),
        backgroundColor: ColorManager.primary2Color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputDesProduct(),
                  SizedBox(width: 50),
                  InputDetailProduct(),
                  UploadImageProduct()
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomShowProduct(),
    );
  }
}
