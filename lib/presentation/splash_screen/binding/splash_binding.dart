import 'package:get/get.dart';
import 'package:sufi_ishq/presentation/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
