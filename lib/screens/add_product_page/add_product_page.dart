import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/screens/add_product_page/add_product_page_logic.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/input_desrp_product.dart';
import 'package:quick_delivery_admin/screens/add_product_page/widget/input_detail_product.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/bottun_custom.dart';

class AddProductPage extends GetView<AddProductPageController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: StyleManager.h2_Bold(),
        ),
        backgroundColor: ColorManager.primary2Color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputDesProduct(),
                  SizedBox(width: 50),
                  InputDetailProduct(),
                  Column(
                    children: [
                      Text(
                        "Upload Product Image:",
                        style: StyleManager.h4_Medium(),
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: controller.imageBytes.value == null
                                ? Center(child: Text("Select Image"))
                                : Image.memory(
                                    controller.imageBytes.value!,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 200,
              child: BottouCustom(
                function: controller.calnsel,
                text: "Calnsel",
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
                text: "Add Product",
                textColor: ColorManager.whiteColor,
                background: ColorManager.secoundColor,
                borderRadius: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
