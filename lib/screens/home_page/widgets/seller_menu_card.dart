import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            controller.indexPageSeller.value = 0;
          },
          child: MenuCard(
            icon: Icons.dashboard,
            title: "Dashboard",
          ),
        ),
        InkWell(
          onTap: () {
            controller.indexPageSeller.value = 1;
          },
          child: MenuCard(
            icon: Icons.store,
            title: "All Products",
          ),
        ),
        MenuCard(
          icon: Icons.delivery_dining,
          title: "My Orders",
        ),
        MenuCard(
          icon: Icons.settings,
          title: "Settings",
        ),
        MenuCard(
          icon: Icons.logout,
          title: "Log out",
        ),
      ],
    );
  }
}
