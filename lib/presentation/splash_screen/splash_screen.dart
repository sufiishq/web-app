import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/presentation/splash_screen/controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: Alignment.center, children: [
          Center(
            child: Text(
              'lbl_sufi_ishq'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ]),
      ),
    );
  }
}
