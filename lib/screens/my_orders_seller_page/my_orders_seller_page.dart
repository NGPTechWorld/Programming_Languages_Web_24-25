import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/my_orders_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/widgets/order_card.dart';

class MyOrdersSellerPage extends GetView<MyOrdersSellerPageController> {
  const MyOrdersSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getOrders();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.MyOrders.tr,
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
              Obx(
                () => Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: List.generate(
                    controller.orders.length,
                    (index) => OrderCard(orderModel: controller.orders[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
