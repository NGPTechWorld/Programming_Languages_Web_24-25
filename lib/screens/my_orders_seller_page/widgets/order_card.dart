import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/module/order_model.dart';
import 'package:quick_delivery_admin/screens/my_orders_seller_page/widgets/status_label.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.primary2Color.withAlpha(100),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
      child: Center(
        child: ListTile(
          leading: Text(
            "id: ${orderModel.id}",
            style: StyleManager.h4_Regular(),
          ),
          title: Text(
            StringManager.DateOrder.tr + orderModel.date,
            style: StyleManager.body02_Semibold(),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.products.tr,
                style: StyleManager.body02_Medium(),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: List.generate(
                    orderModel.products.length,
                    (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              StringManager.name.tr +
                                  (Get.locale.toString() == "ar"
                                      ? orderModel.products[index].nameAr
                                      : orderModel.products[index].nameEn),
                              style: StyleManager.body01_Regular(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              StringManager.quantity.tr +
                                  orderModel.products[index].quantity
                                      .toString(),
                              style: StyleManager.body01_Regular(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              StringManager.price.tr +
                                  orderModel.products[index].price.toString(),
                              style: StyleManager.body01_Regular(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              StringManager.cost.tr +
                                  orderModel.products[index].cost.toString(),
                              style: StyleManager.body01_Regular(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                StringManager.total_cost.tr + orderModel.totalCost.toString(),
                style: StyleManager.body02_Semibold(),
              ),
            ],
          ),
          minVerticalPadding: AppPadding.p8,
          trailing: Container(
            width: AppSizeScreen.screenWidth * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatusLabel(statusId: orderModel.statusId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
