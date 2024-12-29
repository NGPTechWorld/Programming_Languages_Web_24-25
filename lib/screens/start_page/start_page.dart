import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/start_page/start_page_logic.dart';
import '../../../app/config/assets_manager.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});
  final controller = Get.find<StartPageController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      controller.startApp();
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AssetsManager.appIcon,
                fit: BoxFit.contain,
                width: AppSizeScreen.screenWidth / 1.8,
                height: AppSizeScreen.screenHeight / 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p40),
              child: CircularProgressIndicator(
                color: ColorManager.firstColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
