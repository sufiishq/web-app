import 'dart:async';

import 'package:get/get.dart';
import 'package:sufi_ishq/service/api_provider.dart';

class BaseService {
  final APIProvider _apiProvider = GetInstance().find<APIProvider>();

  Future getHijriDate({required String url, required String endpoint}) async {
    return await _apiProvider.getHijriDate(url, endpoint);
  }
}
