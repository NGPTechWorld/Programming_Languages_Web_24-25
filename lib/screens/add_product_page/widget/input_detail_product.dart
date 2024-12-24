import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/text_field_custom.dart';

class InputDetailProduct extends GetView<AddProductPageController> {
  const InputDetailProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizeScreen.screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "Enter Price:",
            style: StyleManager.h4_Medium(),
          ),
          SizedBox(
            width: AppSizeScreen.screenWidth * 0.1,
            child: TextFieldCustom(
                controller: controller.priceController,
                keyboardType: TextInputType.number),
          ),
          SizedBox(height: 10),
          Text(
            "Enter Quantity:",
            style: StyleManager.h4_Medium(),
          ),
          SizedBox(
            width: AppSizeScreen.screenWidth * 0.1,
            child: TextFieldCustom(
                controller: controller.quantityController,
                keyboardType: TextInputType.number),
          ),
          SizedBox(height: 10),
          Text(
            "Select Category:",
            style: StyleManager.h4_Medium(),
          ),
          SizedBox(
            width: AppSizeScreen.screenWidth * 0.2,
            child: DropdownButtonFormField<int>(
              value: controller
                  .selectedCategory.value, // استخدام RxInt.value مباشرة
              onChanged: (newValue) {
                controller.selectedCategory.value = newValue!;
              },
              items: controller.categories.map((category) {
                return DropdownMenuItem<int>(
                  value: category['id'] as int,
                  child: Text(
                    category['name'] as String,
                    style: StyleManager.h4_Regular(),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
