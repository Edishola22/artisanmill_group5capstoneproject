import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_state.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CompleteUserProfileScreen extends StatefulWidget {
  const CompleteUserProfileScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

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
        centerTitle: true,
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
                      hintText: 'Enter your name',
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'Name required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'State',
                      hintText: 'Enter your state',
                      controller: _stateController,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'State required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'City',
                      controller: _cityController,
                      hintText: 'Enter your city',
                      inputType: TextInputType.name,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'City required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'Street Address',
                      inputType: TextInputType.streetAddress,
                      hintText: 'Enter your street address',
                      controller: _addressController,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'Street address required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Read our terms and conditions',
                      style: context.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 24.h),
                    BlocConsumer<UserBloc, UserState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () => null,
                          success: (_) {
                            context.showSuccessSnackBar('Profile created!');
                            _navigateToHome();
                          },
                          error: (message) {
                            context.showErrorSnackBar(message);
                          }
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => PlainAppButton(
                            width: 197.w,
                            height: 51.h,
                            text: 'Completed',
                            onTap: () => createUserDetails(),
                          ),
                          loading: () => const CircularProgressIndicator(),
                        );
                      },
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

  void createUserDetails() {
    if(_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final city = _cityController.text.trim();
      final state = _stateController.text.trim();
      final streetAddress = _addressController.text.trim();
      final phoneNumber = widget.phoneNumber;

      final userBloc = BlocProvider.of<UserBloc>(context);
      userBloc.add(
        CreateUserDocumentEvent(
          name: name,
          city: city,
          state: state,
          phone: phoneNumber,
          address: streetAddress,
        ),
      );
    }
  }

  void _navigateToHome() {
    context.goNamed('home');
  }
}
