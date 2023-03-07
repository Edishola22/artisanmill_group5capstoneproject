import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/avatar_widget.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ArtisanHomeTab extends StatefulWidget {
  const ArtisanHomeTab({Key? key}) : super(key: key);

  @override
  State<ArtisanHomeTab> createState() => _ArtisanHomeTabState();
}

class _ArtisanHomeTabState extends State<ArtisanHomeTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.homeBackgroundImage.path,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchField(),
                  SizedBox(height: 24.h),
                  FittedBox(
                    child: Text(
                      'WORK\nSMARTER',
                      textAlign: TextAlign.start,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 58.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  FittedBox(
                    child: Text(
                      'CONNECT\nWITH MORE\nCLIENTS',
                      textAlign: TextAlign.start,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 32.sp,
                        color: AppColours.orangeLight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledAppButton(
                    width: 80.w,
                    height: 37.h,
                    text: 'More',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 40),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: AppLogo(
                logo: Assets.images.appLogoWhite.path,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => _navigateToSettings(context),
                    iconSize: 32.w,
                    icon: SvgPicture.asset(
                      Assets.icons.hamburgerIcon.path,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColours.orangeLight,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      child: Row(
                        children: [
                          AvatarWidget(
                            radius: 12.w,
                            imagePath: Assets.images.userProfileAvatar.path,
                          ),
                          SizedBox(width: 8.w),
                          SvgPicture.asset(Assets.icons.notification.path)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      height: 50.h,
      child: TextField(
          controller: _searchController,
          maxLines: 1,
          onTap: () {},
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:
                    const BorderSide(color: AppColours.purpleShadeThree),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:
                    const BorderSide(color: AppColours.purpleShadeThree),
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 4.w),
                  SvgPicture.asset(
                    Assets.icons.searchIcon.path,
                    width: 30.w,
                    height: 30.h,
                  ),
                  VerticalDivider(
                    thickness: 1.w,
                    color: AppColours.purpleShadeThree,
                  )
                ],
              ),
              hintStyle: context.textTheme.bodyLarge,
              hintText: 'Search')),
    );
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
