import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/screens/dashboard_admin_page/dashboard_admin_page_logic.dart';

class MyAdminInfo extends GetView<DashboardAdminPageController> {
  const MyAdminInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardAdminPageController>(
      builder:(controller) =>  Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: [
          Container(
            width: 180,
            height: 120,
            decoration: BoxDecoration(
                color: ColorManager.firstColor.withAlpha(50),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringManager.number_of_markets.tr,
                  style:
                      StyleManager.h4_Semibold(color: ColorManager.primary6Color),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  appStatistics!.numberOfMarkets.toString(),
                  style:
                      StyleManager.h1_Semibold(color: ColorManager.primary6Color),
                ),
              ],
            ),
          ),
          Container(
            width: 240,
            height: 120,
            decoration: BoxDecoration(
                color: ColorManager.firstColor.withAlpha(100),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringManager.number_of_orders.tr,
                  style:
                      StyleManager.h4_Semibold(color: ColorManager.primary6Color),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  appStatistics!.numberOfOrders.toString(),
                  style:
                      StyleManager.h1_Semibold(color: ColorManager.primary6Color),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 370,
            height: 120,
            decoration: BoxDecoration(
                color: ColorManager.secoundColor.withAlpha(100),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringManager.number_of_products.tr,
                  style:
                      StyleManager.h4_Semibold(color: ColorManager.primary6Color),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  appStatistics!.numberOfProducts.toString(),
                  style:
                      StyleManager.h1_Semibold(color: ColorManager.primary6Color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
