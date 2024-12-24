import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/assets_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/widgets/menu_bar.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MenuBarCustom(),
          Obx(
            () => Container(
              width: AppSizeScreen.screenWidth * 0.85,
              child: IndexedStack(
                index: controller.indexPageSeller.value,
                children: controller.pagesSeller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SupPage extends StatelessWidget {
  final color;
  const SupPage({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeScreen.screenHeight,
      color: color,
      child: Image.asset(
        AssetsManager.appIcon,
        height: AppSizeScreen.screenHeight * 0.9,
        width: AppSizeScreen.screenWidth * 0.9,
        opacity: const AlwaysStoppedAnimation(.2),
      ),
    );
  }
}
