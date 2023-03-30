import 'package:flutter/material.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu_item.dart';

import '../../../../core/app_export.dart';
import '../../../core/utils/responsive.dart';

class SideMenu extends StatelessWidget {
  final Responsive responsive = Responsive();

  SideMenu({Key? key}) : super(key: key);
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Obx(() => AnimatedContainer(
          width: controller.isDrawerOpen.value ? 250 : 70,
          alignment: Alignment.center,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  controller.openCloseDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      const Icon(Icons.menu),
                      Obx(() => controller.showItemText.value
                          ? Image.asset(
                              ImageConstant.imgCaligraphi,
                              width: 180,
                              height: 50,
                            )
                          : Container(
                              height: 50,
                            )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.arrOfSideMenu.length,
                  itemBuilder: (context, index) {
                    return SideMenuItem(() {
                      controller.updateIteIndex(index);
                    }, controller.arrOfSideMenu[index].title!,
                        controller.arrOfSideMenu[index].image!, index);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
