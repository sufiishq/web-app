import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class ThemeToggle extends StatelessWidget {
  ThemeToggle({Key? key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Constant.themeToggleWidth,
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
        ),
        Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: Constant.duration),
              curve: Curves.linear,
              decoration: BoxDecoration(
                color: getBackgroundColor(ColorInitializer.secondary, context),
                borderRadius: BorderRadius.circular(3.0),
              ),
              margin: EdgeInsets.only(
                  left: controller.isLightTheme.value
                      ? Constant.themeToggleSize0
                      : Constant.themeToggleSize60),
              width: Constant.themeToggleSize60,
              height: Constant.themeToggleSize60,
            )),
        Row(
          children: [
            InkWell(
              onTap: () {
                controller.isLightTheme.value = true;
                Get.changeThemeMode(
                  controller.isLightTheme.value
                      ? ThemeMode.light
                      : ThemeMode.dark,
                );
                controller.saveThemeStatus();
              },
              child: SizedBox(
                width: Constant.themeToggleSize60,
                height: Constant.themeToggleSize60,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    ImageConstant.imgDay,
                    color:
                        getForegroundColor(ColorInitializer.secondary, context),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.isLightTheme.value = false;
                Get.changeThemeMode(
                  controller.isLightTheme.value
                      ? ThemeMode.light
                      : ThemeMode.dark,
                );
                controller.saveThemeStatus();
              },
              child: SizedBox(
                width: Constant.themeToggleSize60,
                height: Constant.themeToggleSize60,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    ImageConstant.imgNight,
                    color: getForegroundColor(
                        ColorInitializer.background, context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
