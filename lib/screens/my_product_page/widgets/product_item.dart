import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/shimmer_placeholder.dart';
import 'package:quick_delivery_admin/screens/my_product_page/my_product_page_logic.dart';

// ignore: must_be_immutable
class ProductItem extends GetView<MyProductPageController> {
  ProductsCardEntite product;
  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: InkWell(
        onTap: () {
          // Get.to(ProductDetailsPage(product.id));
        },
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s18),
            color: ColorManager.primary1Color,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Image.network(
                        product.image,
                        height: 150,
                        width: 150,
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
                            text: product.name + "\n",
                            style: StyleManager.body01_Semibold(
                              color: ColorManager.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: "\n" + product.category,
                            style: StyleManager.body02_Medium(
                              color: ColorManager.primary6Color,
                            ),
                          ),
                          TextSpan(
                            text: "\n" + product.price.toString() + " ",
                            style: StyleManager.body01_Semibold(
                              color: ColorManager.primary5Color,
                            ),
                          ),
                          TextSpan(
                            text: "",
                            style: StyleManager.button2(
                              color: ColorManager.primary5Color,
                            ),
                          ),
                        ],
                      ),
                    ),
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
