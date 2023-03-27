import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../core/utils/dummy_content.dart';

class DashboardController extends GetxController {
  RxList<SideMenuModel> arrOfSideMenu = DummyContent.arrOfSideMenu.obs;
}
