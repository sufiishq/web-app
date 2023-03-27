import 'package:flutter/material.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu_item.dart';
import '../../../../core/app_export.dart';
import '../../../theme/ColorInitializer.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageConstant.imgHelp,
                    width: 24,
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Image.asset(
                      ImageConstant.imgHelp,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.arrOfSideMenu.length,
                itemBuilder: (context, index) {
                  return SideMenuItem(
                      () {},
                      controller.arrOfSideMenu[index].title!,
                      controller.arrOfSideMenu[index].image!,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
