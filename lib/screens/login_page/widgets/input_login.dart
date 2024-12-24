import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/bottun_custom.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/text_field_custom.dart';
import 'package:quick_delivery_admin/screens/login_page/login_page_logic.dart';

class InputLogin extends GetView<LoginPageController> {
  const InputLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizeScreen.screenWidth * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter Name:",
            style: StyleManager.h3_Regular(),
          ),
          TextFieldCustom(
            controller: controller.nameController,
          ),
          Text(
            "Enter Password:",
            style: StyleManager.h3_Regular(),
          ),
          Obx(
            () => TextFieldCustom(
              controller: controller.passwordController,
              obscureText: controller.isVisablePass.value,
              suffixIcon: InkWell(
                child: Icon(Icons.lock_outline_rounded),
                onTap: () {
                  controller.isVisablePass.value =
                      !controller.isVisablePass.value;
                },
              ),
            ),
          ),
          SizedBox(
            height: AppSizeScreen.screenHeight * 0.01,
          ),
          BottouCustom(
            function: () {
              controller.login(context);
            },
            text: "Enter",
            textColor: ColorManager.whiteColor,
          )
        ],
      ),
    );
  }
}
