import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu_item.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
          child: AnimatedSize(
            alignment: Alignment.centerLeft,
            curve: Curves.ease,
            duration: const Duration(milliseconds: Constant.duration),
            child: SizedBox(
              width: controller.isDrawerOpen.value
                  ? Constant.drawerExpandedWidth
                  : Constant.drawerCollapseWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        splashColor: getBackgroundColor(
                            ColorInitializer.secondary, context),
                        highlightColor: getBackgroundColor(
                            ColorInitializer.secondary, context),
                        onTap: () {
                          controller.toggleDrawer();
                        },
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(25, 30, 21, 30),
                            child: Icon(
                              Icons.menu,
                              size: Constant.menuIconSize,
                            )),
                      ),
                      Obx(() => controller.showItemText.value
                          ? Image.asset(
                              ImageConstant.imgCaligraphi,
                              height: Constant.imageCaligraphiHeight,
                            )
                          : Container(
                              height: Constant.imageCaligraphiHeight,
                            )),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.arrOfSideMenu.length,
                      itemBuilder: (context, index) {
                        return SideMenuItem(() {
                          controller.updateIteIndex(index);
                        }, controller.arrOfSideMenu[index].title,
                            controller.arrOfSideMenu[index].image, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
