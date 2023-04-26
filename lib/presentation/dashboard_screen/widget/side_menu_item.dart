import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/theme/app_style.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

// ignore: must_be_immutable
class SideMenuItem extends StatelessWidget {
  SideMenuItem(this.onTap, this.title, this.image, this.pos, {Key? key})
      : super(key: key);
  VoidCallback onTap;
  String title;
  String image;
  int pos;
  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: true,
      focusNode: controller.focusNodes[pos],
      splashColor: getBackgroundColor(ColorInitializer.secondary, context),
      highlightColor: getBackgroundColor(ColorInitializer.secondary, context),
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 8, 15),
            child: Image.asset(
              image,
              width: Constant.menuIconSize24,
              height: Constant.menuIconSize24,
            ),
          ),
          Obx(() => controller.showItemText.value
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 15, 15),
                  child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUbuntuRegular14w500.copyWith(
                          color: getForegroundColor(
                              ColorInitializer.background, context))),
                )
              : Container()),
        ],
      ),
    );
  }
}
