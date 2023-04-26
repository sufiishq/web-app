import 'package:sufi_ishq/service/base_services.dart';

class HomeRepository {
  final BaseService _baseService = BaseService();

  Future fetchHijriDate(url, endPoint) async =>
      _baseService.getHijriDate(url: url, endpoint: endPoint);
}
