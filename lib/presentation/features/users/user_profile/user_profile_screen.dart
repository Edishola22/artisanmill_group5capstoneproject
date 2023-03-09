import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_event.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class UserProfileTab extends StatefulWidget {
  const UserProfileTab({Key? key}) : super(key: key);

  @override
  State<UserProfileTab> createState() => _UserProfileTabState();
}

class _UserProfileTabState extends State<UserProfileTab> {
  @override
  void initState() {
    final userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(FetchUserProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) {
              final user = data as UserDto;
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(Assets.images.userProfileAvatar.path),
                      radius: 51.r,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.name!,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.location.path,
                          width: 24.w,
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          user.state ?? '' ' ,Nigeria',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    FilledAppButton(
                      width: 168.w,
                      height: 40.h,
                      text: 'Edit Profile',
                      onTap: () => _navigateToEditProfile(context, user),
                    ),
                  ],
                ),
              );
            },
            error: (message) => Center(
              child: Text(
                message,
                style: context.textTheme.titleMedium,
              ),
            ),
          );
        },
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
              child: AppLogo(),
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
                    onPressed: () {
                      context
                          .read<UserNavigationBloc>()
                          .add(NavigateToHomeTabEvent());
                    },
                    iconSize: 32.w,
                    icon: Assets.icons.backIcon.svg(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToEditProfile(BuildContext context, UserDto user) {
    context.goNamed(
      'user-edit-profile',
      extra: user,
    );
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
