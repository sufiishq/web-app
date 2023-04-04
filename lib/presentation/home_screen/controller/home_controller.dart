import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufi_ishq/core/utils/local_db_key.dart';

class HomeController extends GetxController {
  RxBool isLightTheme = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> onReady() async {
    super.onReady();
    getThemeStatus();
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
  }
}
