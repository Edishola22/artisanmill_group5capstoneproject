import 'package:artisanmill_group5capstoneproject/domain/models/onboarding_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/widgets/auth_header.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/widgets/onboarding_screen_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/widgets/sign_up.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

const int _kPageCount = 3;

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late final PageController _controller;
  final ValueNotifier<bool> _isLastPage = ValueNotifier(false);

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
              valueListenable: _isLastPage,
              builder: (context, lastPage, child) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.h),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.fastOutSlowIn,
                        child: lastPage
                            ? AuthHeader(
                                key: UniqueKey(),
                              )
                            : AppLogo(
                                key: UniqueKey(),
                              ),
                      ),
                      SizedBox(height: 50.h),
                      Expanded(child: _buildOnboardingPageView()),
                      if (!lastPage) SizedBox(height: 60.h),
                      if (!lastPage) _buildSkipNextButtons(context),
                      if (!lastPage) SizedBox(height: 55.h),
                    ],
                  ),
                );
              }),
          _buildPageIndicator(context),
          SizedBox(height: 50.h),
        ],
      )),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return SmoothPageIndicator(
      controller: _controller,
      count: _kPageCount,
      effect: WormEffect(
        dotWidth: 76.w,
        dotHeight: 15.h,
        activeDotColor: context.colors.secondary,
        dotColor: context.colors.secondary.withOpacity(0.3),
      ),
      onDotClicked: (index) {
        _goToPage(index);
      },
    );
  }

  Widget _buildSkipNextButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlainAppButton(
            width: 103.w,
            height: 44.h,
            text: 'Skip',
            onTap: () => _goToSignUp(),
          ),
          ElevatedButton(
            onPressed: () {
              int currentPage = _controller.page!.toInt();
              _goToPage(++currentPage);
            },
            style: TextButton.styleFrom(
              fixedSize: Size(103.w, 44.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              elevation: 8.h,
            ),
            child: Row(
              children: [
                Text(
                  'Next',
                  style: context.textTheme.titleLarge,
                ),
                SizedBox(width: 8.w),
                const Icon(Icons.arrow_forward_rounded)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goToSignUp() {
    _controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Widget _buildOnboardingPageView() {
    final onboardingItems = OnboardingItem.items;
    return PageView.builder(
      itemCount: _kPageCount,
      physics: const BouncingScrollPhysics(),
      controller: _controller,
      onPageChanged: (index) {
        _isLastPage.value = index == 2;
      },
      itemBuilder: (context, index) {
        if (index != 2) {
          final item = onboardingItems[index];
          return OnboardingScreenItem(item: item);
        } else {
          return const SignUp();
        }
      },
    );
  }

  void _goToPage(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
