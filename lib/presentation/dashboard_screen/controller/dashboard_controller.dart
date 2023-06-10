import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sufi_ishq/core/utils/main_navigation.dart';
import 'package:sufi_ishq/core/audio_player_manager.dart';

class DashboardController extends GetxController {
  RxList<SideMenuModel> arrOfSideMenu = MainNavigation.arrOfSideMenu.obs;
  RxBool isDrawerOpen = true.obs;
  RxBool showItemText = true.obs;
  RxBool isPlaying = false.obs;
  RxBool isMute = false.obs;
  Rx<int> selectedIndex = 0.obs;
  Rx<double> width = 0.0.obs;
  late AudioPlayerManager manager;

  final focusNodes = List.generate(
      MainNavigation.arrOfSideMenu.length, (index) => FocusNode());


  @override
  void onReady() {
    super.onReady();
    manager = AudioPlayerManager();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }


  toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
    showItemText.value = !showItemText.value;
  }

  updateIteIndex(index) {
    selectedIndex.value = index;
    focusNodes[index].requestFocus();
  }

  muteUnMuteVolume(){
    isMute.value = !isMute.value;
  }


}
