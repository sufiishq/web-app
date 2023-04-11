import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class OverflowMenu extends StatelessWidget {
  OverflowMenu({Key? key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Constant.themeToggleSize60,
          height: Constant.themeToggleSize60,
          decoration: BoxDecoration(
            color: getBackgroundColor(ColorInitializer.background, context),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                color: getBackgroundColor(ColorInitializer.primary, context),
                spreadRadius: 1,
                blurRadius: 1, // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.more_vert_outlined,
            size: Constant.menuIconSize24,
          ),
        ),
      ],
    );
  }
}
