import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/my_orders_admin_page/my_orders_admin_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_orders_admin_page/widgets/order_card_admin.dart';

class MyOrdersAdminPage extends GetView<MyOrdersAdminPageController> {
  const MyOrdersAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.MyOrdersPage.tr,
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
                  controller.order.length,
                  (index) =>
                      OrderCardAdmin(orderModel: controller.order[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
