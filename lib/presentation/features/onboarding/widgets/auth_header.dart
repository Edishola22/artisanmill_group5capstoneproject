import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: [
        Image.asset(
          Assets.images.logo.path,
          width: 210.w,
          height: 28.h,
        ),
        SizedBox(height: 4.h),
        Text(
          'Just The Connect You Need',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
