import 'package:artisanmill_group5capstoneproject/domain/models/nav_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../shared/app_logo.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key, required}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            Image.asset(
              Assets.images.cleaning.path,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 127.h,
            )
          ],
        ),
      ),
    );
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 26.w),
        child: const AppLogo(),
      ),
      leadingWidth: 130.w,
      actions: [
        IconButton(
          onPressed: () => _navigateToSettings(context),
          iconSize: 32.w,
          icon: Assets.icons.hamburgerIcon.svg(),
        )
      ],
    );
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
