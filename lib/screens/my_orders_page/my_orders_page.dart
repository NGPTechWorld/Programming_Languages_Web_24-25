import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/my_orders_page/my_orders_page_logic.dart';
import 'package:quick_delivery_admin/screens/my_orders_page/widgets/status_label.dart';

class MyOrdersPage extends GetView<MyOrdersPageController> {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.MyOrdersPage.tr,
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
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: List.generate(
                  10,
                  (index) => OrderCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.primary2Color.withAlpha(100),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
      child: Center(
        child: ListTile(
          leading: Text(
            "id: 5",
            style: StyleManager.h4_Regular(),
          ),
          title: Text(
            "Date Order: ",
            style: StyleManager.body02_Semibold(),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "products:",
                style: StyleManager.body02_Regular(),
              ),
              Text(
                "total_cost",
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
                StatusLabel(statusId: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
