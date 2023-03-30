import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../core/utils/dummy_content.dart';

class DashboardController extends GetxController {
  RxList<SideMenuModel> arrOfSideMenu = DummyContent.arrOfSideMenu.obs;
  RxBool isDrawerOpen = true.obs;
  RxBool showItemText = true.obs;
  Rx<int> selectedIndex = 0.obs;
  final focusNodes =
      List.generate(DummyContent.arrOfSideMenu.length, (index) => FocusNode());

  openCloseDrawer() {
    if (isDrawerOpen.value) {
      isDrawerOpen.value = false;
      showItemText.value = false;
    } else {
      isDrawerOpen.value = true;
      Future.delayed(const Duration(milliseconds: 400), () {
        showItemText.value = true;
      });
    }
  }

  updateIteIndex(index) {
    selectedIndex.value = index;
    focusNodes[index].requestFocus();
  }
}
