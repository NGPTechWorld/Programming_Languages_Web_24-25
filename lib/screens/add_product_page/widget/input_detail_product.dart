import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/text_field_custom.dart';
class InputDetailProduct extends GetView<AddProductPageController> {
  const InputDetailProduct({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizeScreen.screenWidth * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upload Product Image:",
            style: StyleManager.h4_Medium(),
          ),
          SizedBox(height: 10),
          Center(
            child: Obx(
              () => GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: controller.imageBytes.value == null
                      ? Center(child: Text("Select Image"))
                      : Image.memory(
                          controller.imageBytes.value!,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Enter Price:",
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(
              controller: controller.priceController,
              keyboardType: TextInputType.number),
          SizedBox(height: 10),
          Text(
            "Enter Quantity:",
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(
              controller: controller.quantityController,
              keyboardType: TextInputType.number),
          SizedBox(height: 10),
          Text(
            "Select Category:",
            style: StyleManager.h4_Medium(),
          ),
          SizedBox(
            width: AppSizeScreen.screenWidth * 0.3,
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
