import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/entities/Market_card_entite.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:quick_delivery_admin/screens/my_product_seller_page/my_product_seller_page_logic.dart';

// ignore: must_be_immutable
class MarketItem extends GetView<MyProductSellerPageController> {
  MarketCardEntite market;
  MarketItem({super.key, required this.market});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(ProductDetailsPage(product.id));
        controller.showProduct();
      },
      child: Container(
        width: 400,
        //height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s18),
          color: ColorManager.primary1Color,
        ),
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      market.image!,
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
                ),
                Container(
                    constraints: BoxConstraints(
                      maxWidth: 200,
                    ),
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10,
                        right: AppPadding.p10,
                        top: AppPadding.p10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          (Get.locale.toString() == "ar"
                              ? market.nameAr
                              : market.nameEn),
                          style: StyleManager.h3_Bold(
                            color: ColorManager.blackColor,
                          ),
                        ),
                        Text(
                          "\n" + market.manager_name,
                          style: StyleManager.h4_Medium(
                            color: ColorManager.primary6Color,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            PositionedDirectional(
              bottom: 10,
              end: 0,
              child: Column(
                children: [
                  CircleItem(
                    color: ColorManager.firstDarkColor,
                    icon: Icons.edit,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleItem(
                    color: ColorManager.redColor,
                    icon: Icons.delete,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleItem extends StatelessWidget {
  final color;
  final icon;
  const CircleItem({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s24,
      child: Center(
        child: InkWell(
          onTap: () {},
          child: CircleAvatar(
            radius: AppSize.s30,
            backgroundColor: color,
            child: Icon(
              icon,
              color: ColorManager.whiteColor,
              size: AppSize.s16,
            ),
          ),
        ),
      ),
    );
  }
}
