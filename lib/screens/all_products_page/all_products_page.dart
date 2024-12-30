import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/all_products_page/all_products_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/product_item_market_card.dart';

class AllProductsPage extends GetView<AllProductsPageController> {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.AllProducts.tr,
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
              Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container()),
              Obx(
                () => Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: List.generate(
                    controller.products.length,
                    (index) => ProductItemMarketCard(
                        product: controller.products[index]),
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
