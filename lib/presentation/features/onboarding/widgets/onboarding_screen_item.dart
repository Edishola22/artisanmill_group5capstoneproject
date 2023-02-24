import 'package:artisanmill_group5capstoneproject/domain/models/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenItem extends StatelessWidget {
  const OnboardingScreenItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: AspectRatio(
              aspectRatio: 0.79,
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        FittedBox(
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
