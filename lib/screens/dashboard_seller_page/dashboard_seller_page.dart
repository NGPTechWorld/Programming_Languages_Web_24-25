import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page_logic.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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

class MyMarketInfo extends StatelessWidget {
  const MyMarketInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          text: "Market",
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
    );
  }
}
