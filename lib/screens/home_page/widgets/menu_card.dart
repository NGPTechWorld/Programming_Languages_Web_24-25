import 'package:flutter/material.dart';
import 'package:quick_delivery_admin/app/config/color_manager.dart';
import 'package:quick_delivery_admin/app/config/style_manager.dart';
import 'package:quick_delivery_admin/app/config/values_manager.dart';
import 'package:quick_delivery_admin/data/cache/const.dart';

class MenuCard extends StatefulWidget {
  final IconData icon;
  final String title;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: _isHovering
            ? managerCurrent!.role == "seller"
                ? ColorManager.secoundColor
                : ColorManager.firstColor
            : managerCurrent!.role == "seller"
                ? ColorManager.secoundDarkColor
                : ColorManager.firstDarkColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Icon(
                    widget.icon,
                    color: ColorManager.whiteColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(
                    left: AppPadding.p10,
                    right: AppPadding.p10,
                    top: AppPadding.p8),
                child: Text(
                  widget.title,
                  style: StyleManager.h3_Bold(color: ColorManager.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
