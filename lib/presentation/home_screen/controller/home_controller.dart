import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/local_db_key.dart';
import 'package:sufi_ishq/core/utils/pref_utils.dart';

class HomeController extends GetxController {
  RxBool isLightTheme = false.obs;
  Rx<double> width = 0.0.obs;
  @override
  Future<void> onReady() async {
    super.onReady();
    getThemeStatus();
  }

  saveThemeStatus() async {
    PrefUtils.storage.setBool(LocalDBKeys.theme, isLightTheme.value);
  }

  getThemeStatus() async {
    dynamic isLight = PrefUtils.storage.getBool(LocalDBKeys.theme) ?? true;
    isLightTheme.value = await isLight;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
    isLightTheme.value ? Constant.themeToggleSize0 : Constant.themeToggleSize60;
  }
}
