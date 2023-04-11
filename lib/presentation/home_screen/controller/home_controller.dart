import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/local_db_key.dart';
import 'package:sufi_ishq/core/utils/pref_utils.dart';
import 'package:sufi_ishq/presentation/home_screen/repository/home_repository.dart';
import 'package:sufi_ishq/service/api_constant.dart';

class HomeController extends GetxController {
  final HomeRepository _repository = HomeRepository();
  RxBool isLightTheme = false.obs;
  Rx<double> width = 0.0.obs;
  @override
  Future<void> onReady() async {
    super.onReady();
    getThemeStatus();
    callHijriDateApi();
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

  void callHijriDateApi() async {
    var value =
        await _repository.fetchHijriDate(ApiConstant.hijriApiUrl, "08-04-2023");
    if (!value.isError) {
      print(value);
    }
  }
}
