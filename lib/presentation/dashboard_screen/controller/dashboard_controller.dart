import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sufi_ishq/core/utils/main_navigation.dart';

class DashboardController extends GetxController {
  RxList<SideMenuModel> arrOfSideMenu = MainNavigation.arrOfSideMenu.obs;
  RxBool isDrawerOpen = true.obs;
  RxBool showItemText = true.obs;
  Rx<int> selectedIndex = 0.obs;
  final focusNodes = List.generate(
      MainNavigation.arrOfSideMenu.length, (index) => FocusNode());

  toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
    showItemText.value = !showItemText.value;
  }

  updateIteIndex(index) {
    selectedIndex.value = index;
    focusNodes[index].requestFocus();
  }
}
