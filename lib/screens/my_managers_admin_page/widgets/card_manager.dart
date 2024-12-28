import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/entities/manager_card_entitie.dart';
import 'package:quick_delivery_admin/screens/my_managers_admin_page/my_managers_admin_page_logic.dart';

class CardManager extends GetView<MyManagersAdminPageController> {
  const CardManager({
    super.key,
    required this.manager,
  });
  final ManagerCardEntitie manager;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.primary2Color.withAlpha(100),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),
      child: Center(
        child: ListTile(
          leading: Text(
            "id: ${manager.id}",
            style: StyleManager.h4_Regular(),
          ),
          title: Text(
            StringManager.name.tr + ": " + manager.name,
            style: StyleManager.h3_Semibold(),
          ),
          minVerticalPadding: AppPadding.p8,
          trailing: IconButton(
            onPressed: () {
              controller.delete(manager);
            },
            color: ColorManager.redColor,
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
