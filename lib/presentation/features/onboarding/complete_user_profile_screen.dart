import 'package:artisanmill_group5capstoneproject/presentation/shared/CustomTextField.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteUserProfileScreen extends StatefulWidget {
  CompleteUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteUserProfileScreen> createState() =>
      _CompleteUserProfileScreenState();
}

class _CompleteUserProfileScreenState extends State<CompleteUserProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _nameController;
  late final TextEditingController _stateController;
  late final TextEditingController _cityController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _addressController.dispose();
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
              backgroundImage: Assets.images.userAvatar.provider(),
            ),
            SizedBox(height: 32.h),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Name',
                      controller: _nameController,
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
                      label: 'City',
                      controller: _cityController,
                      inputType: TextInputType.name,
                      validator: (value) {},
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'Street Address',
                      inputType: TextInputType.streetAddress,
                      controller: _addressController,
                      validator: (value) {},
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Read our terms and conditions',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 24.h),
                    PlainAppButton(
                      width: 197.w,
                      height: 51.h,
                      text: 'Completed',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
