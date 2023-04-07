import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/responsive.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/home_app_bar.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu.dart';
import 'package:sufi_ishq/presentation/home_screen/home_screen.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class DashboardScreen extends StatelessWidget {
  final Responsive responsive = Responsive();
  final DashboardController controller = Get.put(DashboardController());
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.width.value = MediaQuery.of(context).size.width;
    responsive.setContext(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          controller.width.value < Constant.mobileSize
              ? HomeAppBar()
              : Container(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.width.value < Constant.mobileSize
                    ? Container()
                    : Container(
                        color: getBackgroundColor(
                            ColorInitializer.background, context),
                        child: SideMenu()),
                Expanded(
                  child: HomeScreen(),
                ),
                controller.width.value < Constant.mobileSize
                    ? Container()
                    : Container(
                        width: Constant.rightTabBarWidth,
                        color: getBackgroundColor(
                            ColorInitializer.background, context),
                      ),
              ],
            ),
          ),
          Container(
            height: responsive.setHeight(Constant.playerHeight),
            color: getBackgroundColor(ColorInitializer.background, context),
          ),
        ],
      )),
    );
  }
}
