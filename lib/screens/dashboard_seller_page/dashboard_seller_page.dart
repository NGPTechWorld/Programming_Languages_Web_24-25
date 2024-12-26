import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page_logic.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/widgets/my_market_info.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/widgets/top_product_item.dart';

class DashboardSellerPage extends GetView<DashboardSellerPageController> {
  const DashboardSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.Dashboard.tr,
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
              Container(),
              MyMarketInfo(),
              SizedBox(
                height: 20,
              ),
              Text(
                StringManager.TopSellerProduct.tr,
                style: StyleManager.h2_Bold(),
              ),
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: List.generate(
                  controller.products.length,
                  (index) =>
                      TopProductItem(product: controller.products[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
