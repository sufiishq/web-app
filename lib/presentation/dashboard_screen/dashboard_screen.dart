import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/responsive.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu.dart';
import 'package:sufi_ishq/presentation/home_screen/home_screen.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  final Responsive responsive = Responsive();

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: getBackgroundColor(
                        ColorInitializer.background, context),
                    child: SideMenu()),
                const Expanded(
                  child: HomeScreen(),
                ),
                Container(
                  width: Constant.rightTabBarWidth,
                  color:
                      getBackgroundColor(ColorInitializer.background, context),
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
