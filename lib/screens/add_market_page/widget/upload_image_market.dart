import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page_logic.dart';

class UploadImageMarket extends GetView<AddMarketPageController> {
  const UploadImageMarket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringManager.UploadProductImage.tr,
          style: StyleManager.h4_Medium(),
        ),
        SizedBox(height: 20),
        Obx(
          () => GestureDetector(
            onTap: controller.pickImage,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: controller.imageBytes.value == null
                  ? Center(child: Text(StringManager.SelectImage.tr))
                  : Image.memory(
                      controller.imageBytes.value!,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
