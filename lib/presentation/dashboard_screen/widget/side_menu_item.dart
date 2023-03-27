import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import '../../../../core/app_export.dart';
import '../../../theme/ColorInitializer.dart';

// ignore: must_be_immutable
class SideMenuItem extends StatelessWidget {
  SideMenuItem(this.onTap, this.title, this.image,{Key? key}) : super(key: key);
  VoidCallback onTap;
  String title;
  String image;
  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image,width:24, height:24,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle( color: getForegroundColor(ColorInitializer.background,context),),
            ),
          ),

        ],
      ),
    );
  }
}