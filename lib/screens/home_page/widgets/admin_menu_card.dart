import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/screens/home_page/home_page_logic.dart';
import 'package:quick_delivery_admin/screens/home_page/widgets/menu_card.dart';

class AdminMenuCard extends GetView<HomePageController> {
  const AdminMenuCard({super.key});

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
            title: "Dashboard",
          ),
        ),
        InkWell(
          onTap: () {
            controller.gotToPage(1);
          },
          child: MenuCard(
            icon: Icons.store,
            title: "My Markets",
          ),
        ),
        InkWell(
          onTap: () {
            controller.gotToPage(2);
          },
          child: MenuCard(
            icon: Icons.category,
            title: "All Products",
          ),
        ),
        InkWell(
          onTap: () {
            controller.gotToPage(3);
          },
          child: MenuCard(
            icon: Icons.delivery_dining,
            title: "All Orders",
          ),
        ),
        MenuCard(
          icon: Icons.settings,
          title: "Settings",
        ),
      ],
    );
  }
}
