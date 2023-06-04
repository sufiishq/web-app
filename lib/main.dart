import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/firebase_options.dart';
import 'package:sufi_ishq/theme/themes.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {

    runApp(const SufiIshqApp());
  });
}

class SufiIshqApp extends StatefulWidget {
  const SufiIshqApp({Key? key}) : super(key: key);

  @override
  SufiIshqAppState createState() => SufiIshqAppState();
}

class SufiIshqAppState extends State<SufiIshqApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'lbl_sufi_ishq'.tr,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.dashboardScreen,
      getPages: AppRoutes.pages,
    );
  }
}
