import 'dart:collection';

import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:developer' as dev;

enum LocationSelector { ourShop, yourLocation }

class SchedulingTab extends StatefulWidget {
  const SchedulingTab({Key? key, this.artisan}) : super(key: key);

  final ArtisanDto? artisan;

  @override
  State<SchedulingTab> createState() => _SchedulingTabState();
}

class _SchedulingTabState extends State<SchedulingTab> {
  final hourOfDayList = List.generate(12, (index) => index, growable: false);

  final minutesOfHourList =
  List.generate(60, (index) => index, growable: false);
  late final TextEditingController moreDetailController;

  @override
  void initState() {
    moreDetailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    moreDetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(context),
        body: widget.artisan == null ?
        Center(
          child: Text('No Artisan selected',
          style: context.textTheme.titleLarge,),
        ):
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  'Book a date and time with\n${widget.artisan?.businessName}',
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
                SizedBox(height: 30.h),
                _buildTimePicker(context),
                SizedBox(height: 24.h),
                _buildLocationPicker(context),
                SizedBox(height: 100.h),
                _buildDetailField(context),
                SizedBox(height: 24.h),
                FilledAppButton(
                  width: double.maxFinite,
                  height: 45.h,
                  text: 'Book Now',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),

    );
  }

  Widget _buildDetailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leave More Detail',
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(height: 4.h),
        TextField(
          controller: moreDetailController,
          decoration: InputDecoration(
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          maxLines: 2,
        )
      ],
    );
  }

  Widget _buildLocationPicker(BuildContext context) {
    return Container(
      height: 138.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColours.purpleShadeFive,
      ),
      child: CupertinoPicker(
          itemExtent: 49.h,
          diameterRatio: 50,
          selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
            capStartEdge: false,
            capEndEdge: false,
          ),
          onSelectedItemChanged: (newitem) {},
          children: LocationSelector.values
              .map(
                (location) =>
                Row(
                  children: [
                    const Icon(Icons.check_circle_outlined),
                    SizedBox(width: 24.w),
                    Text(getLocationTitle(location))
                  ],
                ),
          )
              .toList()),
    );
  }

  String getLocationTitle(LocationSelector location) {
    if (location == LocationSelector.ourShop) {
      return 'Our Shop';
    } else {
      return 'Your Location';
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  Widget _buildCalendar(BuildContext context) {
    final currentTime = DateTime.now();
    final selectedDays = LinkedHashSet<DateTime>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    selectedDays.addAll([
      DateTime(currentTime.year, currentTime.month, 5),
      DateTime(currentTime.year, currentTime.month, 17),
      DateTime(currentTime.year, currentTime.month, 22),
      DateTime(currentTime.year, currentTime.month, 27),
    ]);
    dev.log(selectedDays.toString());
    return TableCalendar(
      focusedDay: currentTime,
      rangeStartDay: currentTime,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600
        ),
        weekendStyle: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600
        ),
      ),
      headerVisible: false,
      calendarBuilders:
      CalendarBuilders(selectedBuilder: (context, day, focusedDay) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: AppColours.purpleShadeFour,
            child: Text(
              day.day.toString(),
            ),
          ),
        );
      }),
      selectedDayPredicate: (time) {
        dev.log('selected day is $time');
        return selectedDays.contains(time);
      },
      firstDay: DateTime(currentTime.year, currentTime.month, 1),
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

  Widget _buildTimePicker(BuildContext context) {
    dev.log(hourOfDayList.toString());
    final numFormat = NumberFormat("00");
    return Container(
      height: 140.h,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 27.w),
      decoration: BoxDecoration(
          color: AppColours.purpleShadeFive,
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Pick Time',
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 50.h,
          child: Row(
            children: [
              SizedBox(
                width: 50.w,
                child: CupertinoPicker(
                  itemExtent: 50.h,
                  onSelectedItemChanged: (newItem) {},
                  backgroundColor: AppColours.orangeLight,
                  selectionOverlay: null,
                  children: hourOfDayList
                      .map(
                        (hour) =>
                        Center(
                          child: Text(
                            numFormat.format(hour),
                            style: context.textTheme.titleLarge?.copyWith(
                                fontSize: 30.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                ':',
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(width: 2.w),
              SizedBox(
                width: 50.w,
                child: CupertinoPicker(
                  itemExtent: 50.h,
                  onSelectedItemChanged: (newItem) {},
                  backgroundColor: AppColours.orangeLight,
                  selectionOverlay: null,
                  children: minutesOfHourList
                      .map(
                        (minute) =>
                        Center(
                          child: Text(
                            numFormat.format(minute),
                            style: context.textTheme.titleLarge?.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                  )
                      .toList(),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                      border: Border.all(color: Colors.black)),
                  child: FittedBox(
                    child: Text(
                      'AM',
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                      border: Border.all(color: Colors.black)),
                  child: FittedBox(
                    child: Text(
                      'PM',
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            Icons.check_circle_outline_outlined,
            size: 34.w,
          ),
        )
      ]),
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
