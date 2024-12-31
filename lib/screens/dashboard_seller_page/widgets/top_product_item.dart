import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/entities/products-card_entite.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:quick_delivery_admin/screens/dashboard_seller_page/dashboard_seller_page_logic.dart';

// ignore: must_be_immutable
class TopProductItem extends GetView<DashboardSellerPageController> {
  ProductsCardEntite product;
  TopProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s18),
            color: ColorManager.primary1Color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    product.image!,
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
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p10,
                    right: AppPadding.p10,
                    top: AppPadding.p10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: (Get.locale.toString() == "ar"
                                ? product.nameAr
                                : product.nameEn) +
                            "\n",
                        style: StyleManager.body01_Semibold(
                          color: ColorManager.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: "\n" +
                            (Get.locale.toString() == "ar"
                                ? product.categoryAr
                                : product.categoryEn),
                        style: StyleManager.body02_Medium(
                          color: ColorManager.primary6Color,
                        ),
                      ),
                      TextSpan(
                        text: "\n\n" + product.price.toString() + " ",
                        style: StyleManager.body01_Semibold(
                          color: ColorManager.primary5Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
