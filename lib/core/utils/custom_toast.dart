import 'package:fluttertoast/fluttertoast.dart';
import 'package:sufi_ishq/core/utils/constant.dart';

class CustomToast {
  void showToast(String body, bool error) {
    Fluttertoast.showToast(
        msg: body,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: Constant.fontSize14);
  }
}
