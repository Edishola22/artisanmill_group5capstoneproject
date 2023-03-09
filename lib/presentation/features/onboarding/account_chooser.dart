import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountChooserScreen extends StatelessWidget {
  const AccountChooserScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
        backgroundColor: context.colors.background,
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              onTap: () => _navigateToCompleteUserProfileScreen(context),
            ),
            SizedBox(height: 18.h),
            PlainAppButton(
              width: 122.w,
              height: 49.h,
              text: 'Artisan',
              onTap: () => _navigateToCompleteArtisanProfileScreen(context),
            ),
            SizedBox(height: 90.h),
            Text(
              'Read our terms and conditions',
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCompleteUserProfileScreen(BuildContext context) {
    context.goNamed('complete-user-profile', queryParams: {
      'phone': phoneNumber,
    });
  }

  void _navigateToCompleteArtisanProfileScreen(BuildContext context) {
    context.goNamed(
      'complete-artisan-profile',
        queryParams: {
          'phone': phoneNumber,
        }
    );
  }
}
