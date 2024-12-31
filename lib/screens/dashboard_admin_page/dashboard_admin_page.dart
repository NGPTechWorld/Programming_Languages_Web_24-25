import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/assets_manager.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/dashboard_admin_page/dashboard_admin_page_logic.dart';
import 'package:quick_delivery_admin/screens/dashboard_admin_page/widgets/my_admin_info.dart';
import 'package:quick_delivery_admin/screens/dashboard_admin_page/widgets/top_product_item_admin.dart';

class DashboardAdminPage extends GetView<DashboardAdminPageController> {
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getTopProducts();
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
              MyAdminInfo(),
              SizedBox(
                height: 20,
              ),
              Text(
                StringManager.TopSellerProduct.tr,
                style: StyleManager.h2_Bold(),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Obx(
                  () => Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: List.generate(
                      controller.products.length,
                      (index) => TopProductItemAdmin(
                          product: controller.products[index]),
                    ),
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
