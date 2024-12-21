import 'package:flutter/material.dart';
import 'package:quick_delivery_admin/app/config/assets_manager.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/bottun_custom.dart';
import 'package:quick_delivery_admin/screens/custom_widgets/text_field_custom.dart';
import 'package:quick_delivery_admin/screens/login_page/widgets/input_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSizeScreen.screenHeight * 0.1,
            ),
            Center(
              child: Image.asset(
                AssetsManager.appIcon,
                height: AppSizeScreen.screenHeight * 0.2,
                width: AppSizeScreen.screenWidth * 0.2,
              ),
            ),
            InputLogin(),
          ],
        ),
      ),
    );
  }
}
