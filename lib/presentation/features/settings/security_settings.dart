import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/widgets/settings_item.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecuritySettings extends StatelessWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Column(
            children: [
              SettingsItem(
                color: AppColours.purpleShadeFour,
                verticalPadding: 4.h,
                title: 'Login security',
                iconSize: 20.w,
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                icon: Assets.icons.loginSecurity.path,
              ),
              SizedBox(height: 16.h),
              SettingsItem(
                color: Colors.white,
                elevation: 2.h,
                verticalPadding: 4.h,
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                iconSize: 20.w,
                title: 'Password',
                icon: Assets.icons.password.path,
              ),
              SizedBox(height: 16.h),
              SettingsItem(
                color: Colors.white,
                elevation: 2.h,
                verticalPadding: 4.h,
                iconSize: 20.w,
                title: 'Login activity',
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                icon: Assets.icons.loginActivity.path,
              ),
              SizedBox(height: 16.h),
              SettingsItem(
                color: Colors.white,
                elevation: 2.h,
                verticalPadding: 4.h,
                iconSize: 20.w,
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                title: 'Two-factor authentication',
                icon: Assets.icons.twoFactor.path,
              ),
              SizedBox(height: 16.h),
              SettingsItem(
                color: Colors.white,
                elevation: 2.h,
                verticalPadding: 4.h,
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                iconSize: 20.w,
                title: 'Security Checkup',
                icon: Assets.icons.securityCheckup.path,
              ),

              SizedBox(height: 16.h),
              SettingsItem(
                color: Colors.white,
                elevation: 2.h,
                verticalPadding: 4.h,
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                iconSize: 20.w,
                title: 'Advanced',
                icon: Assets.icons.advanced.path,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
