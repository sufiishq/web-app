import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/theme/app_style.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class HijriCalender extends StatelessWidget {
  HijriCalender({Key? key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Constant.themeToggleSize60,
          decoration: BoxDecoration(
            color: getBackgroundColor(ColorInitializer.secondary, context),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                color: getBackgroundColor(ColorInitializer.primary, context),
                spreadRadius: 1,
                blurRadius: 1, // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: Constant.space10,
              ),
              Text("1444 hijri",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUbuntuRegular14w500.copyWith(
                      color: getForegroundColor(
                          ColorInitializer.secondary, context))),
              const Spacer(),
              Text("صَفَر",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUbuntuRegular18w500.copyWith(
                      color: getForegroundColor(
                          ColorInitializer.secondary, context))),
              Text(" 26",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUbuntuRegular18w500.copyWith(
                      color: getForegroundColor(
                          ColorInitializer.secondary, context))),
              const Spacer(),
              Text("Sunday",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUbuntuRegular14w500.copyWith(
                      color: getForegroundColor(
                          ColorInitializer.secondary, context))),
              const SizedBox(
                width: Constant.space10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
