import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            _buildSettingsItem(
              context: context,
              color: context.colors.primary,
              title: 'Security',
              icon: Assets.icons.security.path,
            ),
            SizedBox(height: 18.h),
            _buildSettingsItem(
              context: context,
              color: AppColours.purpleShadeOne,
              title: 'Help & Feedback',
              icon: Assets.icons.help.path,
            ),
            SizedBox(height: 18.h),
            _buildSettingsItem(
              context: context,
              color: AppColours.purpleShadeOne,
              title: 'About',
              icon: Assets.icons.about.path,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required BuildContext context,
    required Color color,
    required String title,
    required String icon,
  }) {
    return ListTile(
      leading: Text(
        title,
        style: context.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      tileColor: color,
      trailing: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.colors.onSurface,
          BlendMode.srcIn,
        ),
        width: 24.w,
      ),
    );
  }
}
