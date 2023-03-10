import 'dart:async';

import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as dev;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if(mounted) {
        final authBloc = BlocProvider.of<AuthBloc>(context);
        dev.log('Auth state is ${authBloc.state}');
        if(authBloc.state == AuthState.authenticatedUser()) {
          context.goNamed('user-home');
        }
        else if(authBloc.state == AuthState.authenticatedArtisan()) {
          context.goNamed('artisan-home');
        }
        else if(authBloc.state == AuthState.authenticatedUnknown()) {
          context.goNamed('account-chooser');
        }
        else {
          context.goNamed('onboarding');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColours.purpleShadeFour,
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.icons.splashLeftIcon.path),
            SizedBox(width: 10.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.splashTopIcon.path),
                SizedBox(height: 16.h),
                Image.asset(
                  Assets.images.logo.path,
                  width: 114.w,
                  height: 24.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: SvgPicture.asset(Assets.icons.splashBottomIcon.path),
                ),
              ],
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset(Assets.icons.splashRightIcon.path),
          ],
        )),
      ),
    );
  }
}
