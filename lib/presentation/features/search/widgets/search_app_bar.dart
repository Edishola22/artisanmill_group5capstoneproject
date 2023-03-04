import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const AppLogo(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => _navigateToSettings(context),
                  iconSize: 32.w,
                  icon: Assets.icons.hamburgerIcon.svg(),
                ),
                IconButton(
                  onPressed: onBackPressed,
                  iconSize: 32.w,
                  icon: Assets.icons.backIcon.svg(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
