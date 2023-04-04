import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: getBackgroundColor(ColorInitializer.background, context),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.isLightTheme.value = true;
                  Get.changeThemeMode(
                    controller.isLightTheme.value
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                  controller.saveThemeStatus();
                },
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.green,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.isLightTheme.value = false;
                  Get.changeThemeMode(
                    controller.isLightTheme.value
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                  controller.saveThemeStatus();
                },
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
