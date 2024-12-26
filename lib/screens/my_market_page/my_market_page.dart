import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/my_market_page/my_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_market_page/widgets/market_item.dart';

class MyMarketPage extends GetView<MyMarketPageController> {
  const MyMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.MyMarket.tr,
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
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: List.generate(
                  controller.products.length + 1,
                  (index) => index == 0
                      ? Container(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          width: 400,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Card(
                                color: ColorManager.primary3Color,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: ColorManager.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : MarketItem(product: controller.products[index - 1]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
