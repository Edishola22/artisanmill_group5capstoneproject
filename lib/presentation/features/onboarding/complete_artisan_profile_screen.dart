import 'dart:ffi';

import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteArtisanProfileScreen extends StatefulWidget {
  const CompleteArtisanProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteArtisanProfileScreen> createState() =>
      _CompleteArtisanProfileScreenState();
}

enum ExperienceLevel { novice, intermediate, expert }

class _CompleteArtisanProfileScreenState
    extends State<CompleteArtisanProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _businessNameController;
  late final TextEditingController _stateController;
  late final TextEditingController _occupationController;
  late final TextEditingController _businessDescriptionController;
  final ValueNotifier<ExperienceLevel?> artisanExperienceLevel =
      ValueNotifier(null);

  @override
  void initState() {
    _businessNameController = TextEditingController();
    _stateController = TextEditingController();
    _occupationController = TextEditingController();
    _businessDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _stateController.dispose();
    _occupationController.dispose();
    _businessDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        backgroundColor: context.colors.background,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Complete Your Profile',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 42.h),
            CircleAvatar(
              radius: 30.r,
              backgroundImage: Assets.images.artisanAvatar.provider(),
            ),
            SizedBox(height: 32.h),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Business Name',
                      controller: _businessNameController,
                      inputType: TextInputType.name,
                      validator: (value) {},
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'State',
                      controller: _stateController,
                      inputType: TextInputType.name,
                      validator: (value) {},
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'Occupation',
                      controller: _occupationController,
                      inputType: TextInputType.name,
                      validator: (value) {},
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'Business Description',
                      inputType: TextInputType.streetAddress,
                      controller: _businessDescriptionController,
                      validator: (value) {},
                    ),
                    SizedBox(height: 24.h),
                    _buildLevelOfExpertiseField(context),
                    SizedBox(height: 24.h),
                    Text(
                      'Please note that your profile will be created only '
                      'after it has been vetted and confirmed',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 24.h),
                    FilledAppButton(
                      width: 169.w,
                      height: 45.h,
                      text: 'Submit',
                      onTap: () {},
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLevelOfExpertiseField(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 116.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: context.colors.onSurface),
      ),
      alignment: Alignment.topCenter,
      child: Ink(
        width: 250.w,
        height: 51.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: context.colors.primary,
        ),
        child: ValueListenableBuilder<ExperienceLevel?>(
          valueListenable: artisanExperienceLevel,
          builder: (context, value, child) {
            return DropdownButton<ExperienceLevel>(
              alignment: AlignmentDirectional.center,
              value: value,
              underline: const SizedBox.shrink(),
              isExpanded: true,
              items: ExperienceLevel.values
                  .map((level) => DropdownMenuItem<ExperienceLevel>(
                        value: level,
                        child: Text(level.name),
                      ))
                  .toList(),
              onChanged: (level) {
                if(level != null) {
                  artisanExperienceLevel.value = level;
                }
              },
              icon: const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(10.r),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Level of Expertise',
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(width: 6.w),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16,
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
