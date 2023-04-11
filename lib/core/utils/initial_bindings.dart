import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/service/api_provider.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => APIProvider());
    Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    }, permanent: true);
  }
}
