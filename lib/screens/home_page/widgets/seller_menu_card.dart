import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/widgets/menu_card.dart';

class SellerMenuCard extends GetView<HomePageController> {
  const SellerMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.gotToPage(0);
          },
          child: MenuCard(
            icon: Icons.dashboard,
            title: StringManager.Dashboard.tr,
          ),
        ),
        InkWell(
          onTap: () {
            controller.gotToPage(1);
          },
          child: MenuCard(
            icon: Icons.store,
            title: StringManager.MyProducts.tr,
          ),
        ),
        InkWell(
          onTap: () {
            controller.gotToPage(2);
          },
          child: MenuCard(
            icon: Icons.delivery_dining,
            title: StringManager.MyOrders.tr,
          ),
        ),
        InkWell(
          onTap: () {
            controller.gotToPage(3);
          },
          child: MenuCard(
            icon: Icons.settings,
            title: StringManager.Settings.tr,
          ),
        ),
        InkWell(
          onTap: () {
            controller.languageOnTap();
          },
          child: MenuCard(
            icon: Icons.language,
            title: StringManager.languageDialogTitle.tr,
          ),
        ),
        MenuCard(
          icon: Icons.logout,
          title: StringManager.logout.tr,
        ),
      ],
    );
  }
}
