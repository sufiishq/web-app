import 'package:flutter/material.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: ColorConstant.whiteA700,
            child: Stack(alignment: Alignment.center, children: [
              const Center(
                child: Text(
                  "Sufi Ishq",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Obx(() => Text(
                        "Version: ${controller.appVersion.value}",
                        textAlign: TextAlign.center,
                      )))
            ])),
      ),
    );
  }
}
