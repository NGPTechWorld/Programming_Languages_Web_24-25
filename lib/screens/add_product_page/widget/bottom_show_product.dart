import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/bottun_custom.dart';

class BottomShowProduct extends GetView<AddProductPageController> {
  const BottomShowProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 200,
            child: BottouCustom(
              function: controller.calnsel,
              text: StringManager.cansel.tr,
              textColor: ColorManager.primary6Color,
              background: ColorManager.primary1Color,
              borderRadius: 15,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Obx(
            () => SizedBox(
              width: 200,
              child: controller.moniterMode.value
                  ? BottouCustom(
                      function: () {},
                      text: StringManager.EditProduct.tr,
                      textColor: ColorManager.whiteColor,
                      background: ColorManager.firstDarkColor,
                      borderRadius: 15,
                    )
                  : BottouCustom(
                      function: () {},
                      text: StringManager.AddProduct.tr,
                      textColor: ColorManager.whiteColor,
                      background: ColorManager.secoundColor,
                      borderRadius: 15,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
