import 'package:get/get.dart';
import 'package:sufi_ishq/presentation/home_screen/home_screen.dart';
import 'package:sufi_ishq/presentation/splash_screen/binding/splash_binding.dart';
import 'package:sufi_ishq/presentation/splash_screen/splash_screen.dart';
import '../presentation/home_screen/binding/home_binding.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/home_screen';
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
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
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
