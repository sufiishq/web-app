import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufi_ishq/core/app_export.dart';

class PrefUtils {
  static var storage = Get.find<SharedPreferences>();

  static Future<void> clearLocalStorage() async {
    storage.clear();
  }
}
