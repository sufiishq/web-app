import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/hijri_calender.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/overflow_menu.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/theme_toggle.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.width.value = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: getBackgroundColor(ColorInitializer.surface, context),
            image: const DecorationImage(
              scale: 2,
              image: AssetImage(ImageConstant.imgPattern),
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(Constant.space15),
                child: Row(
                  children: [
                    controller.width.value < Constant.mobileSize
                        ? Container()
                        : OverflowMenu(),
                    const SizedBox(
                      width: Constant.space15,
                    ),
                    controller.width.value < Constant.mobileSize
                        ? Container()
                        : Expanded(child: HijriCalender()),
                    const SizedBox(
                      width: Constant.space15,
                    ),
                    controller.width.value < Constant.mobileSize
                        ? Container()
                        : ThemeToggle(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
