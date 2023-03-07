import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_event.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/settings/widgets/settings_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
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
              onTapped: () => showLogoutDialog(context),
              icon: Assets.icons.signOutIcon.path,
              textStyle: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColours.purpleShadeFive,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          height: 200.h,
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 47.w,
              vertical: 30.h,
            ),
            child: Column(
              children: [
                Text(
                  'Are you sure you want to\n log out?',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Row(
                  children: [
                    FilledAppButton(
                      onTap: () => context.pop(),
                      text: 'Cancel',
                      width: 80.w,
                      height: 37.h,
                    ),
                    const Spacer(),
                    FilledAppButton(
                      onTap: () {
                        context.pop();
                        _navigateToLogoutScreen(context);
                      },
                      text: 'Yes',
                      width: 80.w,
                      color: AppColours.purpleShadeFour,
                      height: 37.h,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToLogoutScreen(BuildContext context) {
    //BlocProvider.of<NavigationBloc>(context).add(NavigateToHomeTabEvent());
    BlocProvider.of<AuthBloc>(context).add(LogoutAuthEvent());
    context.goNamed('logout');
  }

  void goToSecuritySettings(BuildContext context) {
    context.goNamed('security');
  }
}
