import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/assets_manager.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/all_products_market_page/all_products_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/product_item_card.dart';

class AllProductsMarketPage extends GetView<AllProductsMarketPageController> {
  const AllProductsMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.AllProductsMarkect.tr,
          style: StyleManager.h2_Bold(),
        ),
        backgroundColor: ColorManager.primary2Color,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              controller.back();
            },
            color: ColorManager.primary6Color,
            icon: Icon(Icons.arrow_back),
          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    (index) =>
                        ProductItemCard(product: controller.products[index]),
                  ),
                ),
              ),
              Center(
                child: Obx(() => controller.products.length == 0
                    ? Image.asset(AssetsManager.emptyBoxImage)
                    : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
