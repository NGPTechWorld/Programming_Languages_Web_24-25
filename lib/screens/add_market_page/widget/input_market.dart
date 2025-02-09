import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/text_field_custom.dart';

class InputMarket extends GetView<AddMarketPageController> {
  const InputMarket({
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
            StringManager.userName.tr,
            style: StyleManager.h4_Medium(),
          ),
          Obx(() => TextFieldCustom(
                controller: controller.name_Controller,
                readOnly: controller.moniterMode.value,
              )),
          SizedBox(height: 10),
          Text(
            StringManager.MarketNameAr.tr,
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.market_name_ar_Controller),
          SizedBox(height: 10),
          Text(
            StringManager.MarketNameEn.tr,
            style: StyleManager.h4_Medium(),
          ),
          TextFieldCustom(controller: controller.market_name_en_Controller),
          SizedBox(height: 10),
          Obx(
            () => controller.moniterMode.value
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringManager.password.tr,
                        style: StyleManager.h4_Medium(),
                      ),
                      TextFieldCustom(
                        controller: controller.passwordController,
                        obscureText: controller.isVisablePass.value,
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.lock_outline_rounded),
                          onTap: () {
                            controller.isVisablePass.value =
                                !controller.isVisablePass.value;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        StringManager.confirmPassword.tr,
                        style: StyleManager.h4_Medium(),
                      ),
                      TextFieldCustom(
                        controller: controller.password_confirmation_Controller,
                        obscureText: controller.isVisableConfPass.value,
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.lock_outline_rounded),
                          onTap: () {
                            controller.isVisableConfPass.value =
                                !controller.isVisableConfPass.value;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
