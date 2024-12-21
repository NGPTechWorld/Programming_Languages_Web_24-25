import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/config/color_manager.dart';
import '../../app/config/string_manager.dart';
import '../../app/config/style_manager.dart';

class HelperWidget {
  static void languageDialgo() {
    Get.defaultDialog(
      backgroundColor: ColorManager.whiteColor,
      title: StringManager.languageDialogTitle.tr,
      titleStyle: StyleManager.h3_Bold(),
      
      content: Container(
        color: ColorManager.whiteColor,
        child: Column(
          children: [
            ListTile(
              title: Text(
                StringManager.languageDialogEnglish.tr,
                style: StyleManager.h4_Medium(),
              ),
              onTap: () {
                Get.updateLocale(Locale('en'));
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                StringManager.languageDialogArabic.tr,
                style: StyleManager.h4_Medium(),
              ),
              onTap: () {
                Get.updateLocale(Locale('ar'));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
