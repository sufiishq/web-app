import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/local_db_key.dart';
import 'package:sufi_ishq/core/utils/pref_utils.dart';
import 'package:sufi_ishq/presentation/home_screen/model/hijri_date_model.dart';
import 'package:sufi_ishq/presentation/home_screen/repository/home_repository.dart';
import 'package:sufi_ishq/service/api_constant.dart';

class HomeController extends GetxController {
  final HomeRepository _repository = HomeRepository();
  Rx<HijriDateModel> hijriDateModel = HijriDateModel().obs;
  RxBool isLightTheme = false.obs;
  Rx<double> width = 0.0.obs;
  Rx<double> angle = 0.0.obs;
  @override
  Future<void> onReady() async {
    super.onReady();
    getThemeStatus();
    checkCurrentDate();

    Timer.periodic(const Duration(milliseconds: Constant.rotateDuration),
        (timer) {
      angle.value += 0.01;
    });
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

  void checkCurrentDate() {
    dynamic currentDate = PrefUtils.storage.getString(LocalDBKeys.hijriDate);

    if (currentDate != null) {
      Map<String, dynamic> map = json.decode(currentDate);
      hijriDateModel.value = HijriDateModel.fromJson(map);
      if (!isCurrentDate(hijriDateModel.value.data!.gregorian!.date!)) {
        callHijriDateApi();
      }
    } else {
      callHijriDateApi();
    }
  }

  void callHijriDateApi() async {
    await _repository
        .fetchHijriDate(ApiConstant.hijriApiUrl, generateFormattedDate())
        .then((value) => {
              hijriDateModel.value = HijriDateModel.fromJson(value),
              PrefUtils.storage.setString(
                  LocalDBKeys.hijriDate, json.encode(hijriDateModel.value)),
            });
  }

  String generateFormattedDate() {
    var now = DateTime.now();
    var formatter = DateFormat(Constant.dateFormat);
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  bool isCurrentDate(String str) {
    var formattedDate = DateFormat(Constant.dateFormatForApi).parse(str);
    try {
      DateTime.parse(formattedDate.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
