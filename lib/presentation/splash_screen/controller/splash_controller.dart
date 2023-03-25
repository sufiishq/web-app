import 'package:package_info_plus/package_info_plus.dart';
import 'package:sufi_ishq/core/app_export.dart';

class SplashController extends GetxController {

  Rx<String> appVersion = "".obs;

  @override
  void onReady() {
    super.onReady();
    getVersion();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(AppRoutes.homeScreen);
    });
  }

  getVersion() async {
    await PackageInfo.fromPlatform().then((value)  {
      appVersion.value = value.version;
    });

  }
}
