import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulingTab extends StatelessWidget {
  const SchedulingTab({Key? key, this.artisan}) : super(key: key);

  final ArtisanDto? artisan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Text(
                'Book a date and time with\n${artisan?.businessName}',
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30.h),
              _buildNoticeContainer(context),
              SizedBox(height: 30.h),
              _buildCalendar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    final currentTime = DateTime.now();
    return TableCalendar(
      focusedDay: currentTime,
      eventLoader: (time) => [
        DateTime(currentTime.year, currentTime.month, 10),
        DateTime(currentTime.year, currentTime.month, 12),
        DateTime(currentTime.year, currentTime.month, 15)
      ],
      firstDay: DateTime(currentTime.year, currentTime.month,1),
      lastDay: DateTime(currentTime.year, currentTime.month + 1, 0),
    );
  }

  Widget _buildNoticeContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColours.orangeLight),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        'Note that the days that are filled are fully booked. Click on the other days to book a suitable time.',
        style: context.textTheme.titleMedium,
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
                      context.pop();
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

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
