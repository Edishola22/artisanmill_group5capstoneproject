import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      Assets.images.logo.path,
      width: 103.w,
      height: 14.32.h,
    );
  }
}
