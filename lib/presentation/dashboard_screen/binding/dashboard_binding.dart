import 'package:get/get.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
