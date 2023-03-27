import 'package:sufi_ishq/core/app_export.dart';
import 'controller/home_controller.dart';
import 'package:flutter/material.dart';

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