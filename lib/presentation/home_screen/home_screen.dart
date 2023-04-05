import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';
import 'package:sufi_ishq/presentation/home_screen/widget/theme_toggle.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: getBackgroundColor(ColorInitializer.surface, context),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Spacer(),
                    ThemeToggle(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
