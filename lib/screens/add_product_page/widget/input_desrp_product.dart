import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/module/product_model.dart';
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
            StringManager.NameEnglish.tr,
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.nameENController),
          SizedBox(height: 10),
          Text(
            StringManager.NameArabic.tr,
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.nameARController),
          SizedBox(height: 10),
          Text(
            StringManager.DescriptionEnglish.tr,
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.descENController),
          SizedBox(height: 10),
          Text(
            StringManager.DescriptionArabic.tr,
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.descARController),
          SizedBox(height: 10),
          Obx(
            () => controller.moniterMode.value
                ? ShowDetailes(
                    product: controller.myproduct!,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class ShowDetailes extends StatelessWidget {
  final Product product;
  const ShowDetailes({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: StringManager.NumberOfPurchases.tr,
                style: StyleManager.h4_Medium(),
              ),
              TextSpan(
                text: product.numberOfPurchases.toString(),
                style: StyleManager.h4_Regular(),
              ),
              TextSpan(
                text: "\n\n" + StringManager.CreateDate.tr,
                style: StyleManager.h4_Medium(),
              ),
              TextSpan(
                text: product.createdAt.year.toString() +
                    '/' +
                    product.createdAt.month.toString() +
                    '/' +
                    product.createdAt.day.toString(),
                style: StyleManager.h4_Regular(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
