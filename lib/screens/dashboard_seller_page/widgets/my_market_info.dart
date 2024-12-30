import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page_logic.dart';

class MyMarketInfo extends GetView<DashboardSellerPageController> {
  const MyMarketInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.MyMarket.tr,
              style: StyleManager.h2_Bold(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: AppSizeScreen.screenWidth * 0.5,
              height: 250,
              decoration: BoxDecoration(
                  color: ColorManager.primary3Color,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      "",
                      height: 200,
                      width: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return ShimmerPlaceholder(height: 150, width: 150);
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return ShimmerPlaceholder(height: 150, width: 150);
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${StringManager.MarketName.tr} \n\n",
                              style: StyleManager.h3_Medium(
                                color: ColorManager.primary6Color,
                              ),
                            ),
                            TextSpan(
                              text: Get.locale.toString() == "ar"
                                  ? managerCurrent!.market_name_ar
                                  : managerCurrent!.market_name_en,
                              style: StyleManager.h1_Bold(
                                color: ColorManager.primary6Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 45),
            child: GetBuilder<DashboardSellerPageController>(
              builder: (controller) => Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: ColorManager.firstColor.withAlpha(50),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          StringManager.MyOrders.tr,
                          style: StyleManager.h4_Semibold(
                              color: ColorManager.primary6Color),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          marcketStatistics!.numberOfOrders.toString(),
                          style: StyleManager.h1_Semibold(
                              color: ColorManager.primary6Color),
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
                          StringManager.MyProducts.tr,
                          style: StyleManager.h4_Semibold(
                              color: ColorManager.primary6Color),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          marcketStatistics!.numberOfProducts.toString(),
                          style: StyleManager.h1_Semibold(
                              color: ColorManager.primary6Color),
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
                          StringManager.salary.tr,
                          style: StyleManager.h4_Semibold(
                              color: ColorManager.primary6Color),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          marcketStatistics!.salary.toString(),
                          style: StyleManager.h1_Semibold(
                              color: ColorManager.primary6Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
