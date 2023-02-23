import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset(
            Assets.images.logo.path,
            width: 103.w,
          ),
          SizedBox(height: 60.h),
          ClipRRect(
            child: Image.asset(""),
          )
        ],
      )),
    );
  }
}
