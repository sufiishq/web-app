import 'package:get/get.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/binding/dashboard_binding.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:sufi_ishq/presentation/home_screen/binding/home_binding.dart';
import 'package:sufi_ishq/presentation/home_screen/home_screen.dart';
import 'package:sufi_ishq/presentation/splash_screen/binding/splash_binding.dart';
import 'package:sufi_ishq/presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/home_screen';
  static const String dashboardScreen = '/dashboard_screen';
  static String initialRoute = '/initial_route';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
