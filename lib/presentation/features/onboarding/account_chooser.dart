import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountChooserScreen extends StatelessWidget {
  const AccountChooserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                Assets.images.logo.path,
                width: 103.w,
                height: 14.32.h,
              ),
              SizedBox(height: 120.h),
              Text(
                'Continue as',
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 120.h),
              FilledAppButton(
                width: 106.w,
                height: 49.h,
                text: 'User',
                onTap: () {},
              ),
              SizedBox(height: 18.h),
              PlainAppButton(
                width: 122.w,
                height: 49.h,
                text: 'Artisan',
                onTap: () {},
              ),
              SizedBox(height: 90.h),
              Text(
                'Read our terms and conditions',
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
