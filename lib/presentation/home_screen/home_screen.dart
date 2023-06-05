import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/hijri_calender.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/overflow_menu.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/theme_toggle.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.width.value = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: getBackgroundColor(ColorInitializer.surface, context),
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
                        : Expanded(
                            child: HijriCalender(controller.hijriDateModel)),
                    const SizedBox(
                      width: Constant.space15,
                    ),
                    controller.width.value < Constant.mobileSize
                        ? Container()
                        : ThemeToggle(),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(
                () => SizedBox(
                  width: controller.width.value < Constant.mobileSize
                      ? Constant.imageSizeOnMobile
                      : Constant.imageSizeOnDesktop,
                  height: controller.width.value < Constant.mobileSize
                      ? Constant.imageSizeOnMobile
                      : Constant.imageSizeOnDesktop,
                  child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(pi * controller.angle.value),
                      alignment: Alignment.center,
                      child: Align(
                          alignment: Alignment.center,
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(pi),
                              child: Image.asset(
                                ImageConstant.imgLogo,
                              )))),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
