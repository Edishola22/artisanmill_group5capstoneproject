import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/widgets/settings_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        leading: const SizedBox.shrink(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SettingsItem(
              title: 'Security',
              color: AppColours.purpleShadeFour,
              icon: Assets.icons.security.path,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
              onTapped: () => goToSecuritySettings(context),
            ),
            SizedBox(height: 18.h),
            SettingsItem(
              color: AppColours.purpleShadeOne,
              title: 'Help & Feedback',
              icon: Assets.icons.help.path,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 18.h),
            SettingsItem(
              color: AppColours.purpleShadeOne,
              title: 'About',
              icon: Assets.icons.about.path,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 18.h),
            SettingsItem(
              color: AppColours.purpleShadeOne,
              title: 'Log out',
              icon: Assets.icons.signOutIcon.path,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void goToSecuritySettings(BuildContext context) {
    context.goNamed('security');
  }
}
