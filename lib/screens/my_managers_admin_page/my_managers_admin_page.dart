import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/my_managers_admin_page/my_managers_admin_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_managers_admin_page/widgets/card_manager.dart';

class MyManagersAdminPage extends GetView<MyManagersAdminPageController> {
  const MyManagersAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.MYManagers.tr,
          style: StyleManager.h2_Bold(),
        ),
        backgroundColor: ColorManager.primary2Color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: List.generate(
                  controller.managers.length + 1,
                  (index) => index == 0
                      ? Container(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          width: AppSizeScreen.screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p10),
                            child: GestureDetector(
                              onTap: controller.addManager,
                              child: Card(
                                color: ColorManager.primary3Color,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: ColorManager.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : CardManager(manager: controller.managers[index - 1]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
