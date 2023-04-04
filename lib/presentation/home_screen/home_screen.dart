import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/presentation/home_screen/controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Text(
              'lbl_home'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
