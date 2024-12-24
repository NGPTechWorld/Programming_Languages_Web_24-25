import 'package:flutter/material.dart';
import 'package:quick_delivery_admin/screens/home_page/widgets/menu_card.dart';

class AdminMenuCard extends StatelessWidget {
  const AdminMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuCard(
          icon: Icons.dashboard,
          title: "Dashboard",
        ),
        MenuCard(
          icon: Icons.store,
          title: "Markets",
        ),
        MenuCard(
          icon: Icons.category,
          title: "All Products",
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
