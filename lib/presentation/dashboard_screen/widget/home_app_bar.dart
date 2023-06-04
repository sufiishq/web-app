import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:Constant.appBarHeight,
        child: Column(
          children: [
            Expanded(
              child: Row(children: [
                const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(
                      Icons.info_outlined,
                      size: Constant.menuIconSize24,
                    )),
                Expanded(
                    child: Image.asset(
                  ImageConstant.imgHpLogo,
                  color:
                      getForegroundColor(ColorInitializer.background, context),
                  height: Constant.imageHpHeight,
                )),
                const Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.more_vert_outlined,
                      size: Constant.menuIconSize24,
                    ))
              ]),
            ),
            Container(
              height: Constant.appBarDivider,
              width: double.maxFinite,
              color: getBackgroundColor(
                  ColorInitializer.secondaryContainer, context),
            )
          ],
        ));
  }
}
