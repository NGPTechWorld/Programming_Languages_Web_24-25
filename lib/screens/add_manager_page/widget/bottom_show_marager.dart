import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/string_manager.dart';
import 'package:quick_delivery_admin/screens/add_manager_page/add_manager_page_logic.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/bottun_custom.dart';

class BottomShowManager extends GetView<AddManagerPageController> {
  const BottomShowManager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 200,
            child: BottouCustom(
              function: controller.calnsel,
              text: StringManager.cansel.tr,
              textColor: ColorManager.primary6Color,
              background: ColorManager.primary1Color,
              borderRadius: 15,
            ),
          ),
          SizedBox(
            width: 10,
          ),
           SizedBox(
              width: 200,
              child: BottouCustom(
                      function: () {},
                      text: StringManager.AddManager.tr,
                      textColor: ColorManager.whiteColor,
                      background: ColorManager.secoundColor,
                      borderRadius: 15,
                    ),
            ),
          
        ],
      ),
    );
  }
}
