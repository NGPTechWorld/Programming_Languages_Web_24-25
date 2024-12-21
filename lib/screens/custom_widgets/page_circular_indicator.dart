import 'package:flutter/material.dart';
import '../../app/config/color_manager.dart';
import '../../app/config/values_manager.dart';

class PageCircularIndicator extends StatelessWidget {
  const PageCircularIndicator({super.key, this.hasHeader = false});
  final bool hasHeader;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppSizeScreen.screenHeight / (hasHeader ? 3 : 2.5)),
        Center(
          child: CircularProgressIndicator(
            color: ColorManager.firstColor,
          ),
        ),
        SizedBox(height: AppSizeScreen.screenHeight / 3),
      ],
    );
  }
}
