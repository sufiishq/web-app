import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufi_ishq/core/app_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    }, permanent: true);
  }
}
