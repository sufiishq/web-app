import 'dart:async';
import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:sufi_ishq/core/utils/widget_utils.dart';
import 'package:sufi_ishq/service/api_constant.dart';

class APIProvider extends GetConnect {
  Future getHijriDate(String url, String endpoint,
      {successMsg, loading, status}) async {
    http.Response response;
    try {
      response = await http.get(Uri.parse(url + endpoint), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, DELETE",
        "Origin": "http://localhost"
      }).timeout(const Duration(seconds: ApiConstant.requestDuration));

      print(response.body);

      if (status != null) {
        return response.statusCode;
      }

      dynamic jsonData;
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        return jsonData;
      } else if (response.statusCode == 401) {
        jsonData = json.decode(response.body);
        return jsonData;
      } else if (response.statusCode == 403) {
        jsonData = json.decode(response.body);
        return jsonData;
      } else {
        jsonData = json.decode(response.body);
        return jsonData;
      }
    } on TimeoutException catch (_) {
      WidgetUtils.showToast('Request time out', true);
      return false;
    } catch (socketException) {
      print(socketException);
      return false;
    }
  }
}
