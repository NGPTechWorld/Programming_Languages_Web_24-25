import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/add_market_page/add_market_page_logic.dart';
import 'package:quick_delivery_admin/screens/add_market_page/widget/bottom_show_market.dart';
import 'package:quick_delivery_admin/screens/add_market_page/widget/input_market.dart';
import 'package:quick_delivery_admin/screens/add_market_page/widget/upload_image_market.dart';

class AddMarketPage extends GetView<AddMarketPageController> {
  const AddMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.moniterMode.value
                ? StringManager.EditMarket.tr
                : StringManager.AddMarket.tr,
            style: StyleManager.h2_Bold(),
          ),
        ),
        backgroundColor: ColorManager.primary2Color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputMarket(),
                  SizedBox(width: 50),
                  controller.moniterMode.value
                      ? UploadImageMarket()
                      : Container()
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomShowMarket(),
    );
  }
}
