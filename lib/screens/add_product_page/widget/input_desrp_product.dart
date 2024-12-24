import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/text_field_custom.dart';

class InputDesProduct extends GetView<AddProductPageController> {
  const InputDesProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizeScreen.screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter Name (English):",
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.nameENController),
          SizedBox(height: 10),
          Text(
            "Enter Name (Arabic):",
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.nameARController),
          SizedBox(height: 10),
          Text(
            "Enter Description (English):",
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.descENController),
          SizedBox(height: 10),
          Text(
            "Enter Description (Arabic):",
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.descARController),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
