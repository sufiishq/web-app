import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu.dart';
import 'package:sufi_ishq/presentation/home_screen/home_screen.dart';
import '../../core/utils/responsive.dart';
import '../../theme/ColorInitializer.dart';
import 'controller/dashboard_controller.dart';

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
                    color: getBackgroundColor(ColorInitializer.background,context),
                    width: responsive.setWidth(15),
                    child: SideMenu()),
                const Expanded(
                  child: HomeScreen(),
                ),
                Container(
                  width: responsive.setWidth(30),
                  color: getBackgroundColor(ColorInitializer.background,context),
                ),
              ],
            ),
          ),
          Container(
            height: responsive.setHeight(10),
           color: getBackgroundColor(ColorInitializer.background,context),
          ),
        ],
      )),
    );
  }
}