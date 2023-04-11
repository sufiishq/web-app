import 'custom_toast.dart';

class WidgetUtils {
  static void showToast(String body, bool error) {
    CustomToast().showToast(body, error);
  }
}
