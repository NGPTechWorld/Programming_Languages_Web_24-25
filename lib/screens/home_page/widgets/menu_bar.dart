import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/assets_manager.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/widgets/admin_menu_card.dart';
import 'package:quick_delivery_admin/screens/home_page/widgets/menu_card.dart';

import 'package:quick_delivery_admin/screens/home_page/widgets/seller_menu_card.dart';

class MenuBarCustom extends GetView<HomePageController> {
  const MenuBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizeScreen.screenHeight,
      width: AppSizeScreen.screenWidth * 0.15,
      color: managerCurrent!.role == "admin"
          ? ColorManager.secoundDarkColor
          : ColorManager.firstDarkColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: ColorManager.whiteColor,
                  child: Image.asset(
                    AssetsManager.appIcon,
                    height: AppSizeScreen.screenHeight * 0.2,
                    width: AppSizeScreen.screenWidth * 0.2,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: AppSizeScreen.screenHeight * 0.05,
            ),
            // AdminMenuCard(),
            managerCurrent!.role == "seller"
                ? SellerMenuCard()
                : AdminMenuCard(),
            GestureDetector(
              onTap: () {
                controller.languageOnTap();
              },
              child: MenuCard(
                icon: Icons.language,
                title: StringManager.languageDialogTitle.tr,
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.logout(context);
              },
              child: MenuCard(
                icon: Icons.logout,
                title: StringManager.logout.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
