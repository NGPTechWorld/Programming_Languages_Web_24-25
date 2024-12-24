import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/input_desrp_product.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/input_detail_product.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/bottun_custom.dart';

class AddProductPage extends GetView<AddProductPageController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: StyleManager.h2_Bold(),
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
                children: [
                  InputDesProduct(),
                  SizedBox(width: 50),
                  InputDetailProduct(),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: BottouCustom(
                  function: () {},
                  text: "Save Product",
                  textColor: ColorManager.whiteColor,
                  background: ColorManager.secoundColor,
                  borderRadius: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
