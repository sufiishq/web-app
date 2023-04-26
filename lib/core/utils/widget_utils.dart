import 'app_toast.dart';

class WidgetUtils {
  static void showToast(String body, bool error) {
    AppToast().showToast(body, error);
  }
}
