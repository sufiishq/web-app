import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/presentation/home_screen/model/hijri_date_model.dart';
import 'package:sufi_ishq/theme/app_style.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

import '../../../core/utils/skeleton.dart';

class HijriCalender extends StatelessWidget {
  HijriCalender(this.model, {Key? key}) : super(key: key);
  Rx<HijriDateModel> model;
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
              Obx(
                () => model.value.data != null
                    ? Text("${model.value.data!.hijri!.year} hijri",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtUbuntuRegular14w500.copyWith(
                            color: getForegroundColor(
                                ColorInitializer.secondary, context)))
                    : SizedBox(
                        width: Constant.space50,
                        height: Constant.space20,
                        child: Skeleton(),
                      ),
              ),
              const Spacer(),
              model.value.data != null
                  ? Text("${model.value.data!.hijri!.month!.ar}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUbuntuRegular18w500.copyWith(
                          color: getForegroundColor(
                              ColorInitializer.secondary, context)))
                  : SizedBox(
                      width: Constant.space50,
                      height: Constant.space20,
                      child: Skeleton(),
                    ),
              model.value.data != null
                  ? Text(" ${model.value.data!.hijri!.day!}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUbuntuRegular18w500.copyWith(
                          color: getForegroundColor(
                              ColorInitializer.secondary, context)))
                  : SizedBox(
                      width: Constant.space50,
                      height: Constant.space20,
                      child: Skeleton(),
                    ),
              const Spacer(),
              model.value.data != null
                  ? Text("${model.value.data!.gregorian!.weekday!.en}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUbuntuRegular14w500.copyWith(
                          color: getForegroundColor(
                              ColorInitializer.secondary, context)))
                  : SizedBox(
                      width: Constant.space50,
                      height: Constant.space20,
                      child: Skeleton(),
                    ),
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
