import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/local_db_key.dart';

import '../../../core/utils/pref_utils.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLightTheme = false.obs;
  AnimationController? animationController;
  Animation<Offset>? animation;

  @override
  Future<void> onReady() async {
    super.onReady();
    getThemeStatus();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: Constant.duration),
    );
    animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInToLinear,
    ));
  }

  saveThemeStatus() async {
    PrefUtils.storage.setBool(LocalDBKeys.theme, isLightTheme.value);
  }

  getThemeStatus() async {
    dynamic isLight = PrefUtils.storage.getBool(LocalDBKeys.theme) ?? true;
    isLightTheme.value = await isLight;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
    isLightTheme.value
        ? animationController!.forward()
        : animationController!.reverse();
  }
}
