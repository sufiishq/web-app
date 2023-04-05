import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/local_db_key.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLightTheme = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late AnimationController animationController;
  late Animation<Offset> animation;

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
      parent: animationController,
      curve: Curves.easeInToLinear,
    ));
  }

  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool(LocalDBKeys.theme, isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool(LocalDBKeys.theme) ?? true;
    }).obs;
    isLightTheme.value = await isLight.value;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
    isLightTheme.value
        ? animationController.forward()
        : animationController.reverse();
  }
}
