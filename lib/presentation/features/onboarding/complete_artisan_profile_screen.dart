import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_state.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/artisan_extension.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CompleteArtisanProfileScreen extends StatefulWidget {
  const CompleteArtisanProfileScreen({Key? key, this.phoneNumber})
      : super(key: key);

  final String? phoneNumber;

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

  final ValueNotifier<ArtisanCategory?> artisanCategory = ValueNotifier(null);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: 'Business Name',
                      controller: _businessNameController,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'Business Name required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'State',
                      controller: _stateController,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'State required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'Occupation',
                      controller: _occupationController,
                      inputType: TextInputType.text,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'Occupation required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      label: 'Business Description',
                      inputType: TextInputType.text,
                      controller: _businessDescriptionController,
                      validator: (value) {
                        if(value!.trim().isEmpty) {
                          return 'Business description required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    _buildCategoryField(context),
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
                    BlocConsumer<ArtisanBloc, ArtisanState>(
                      listener: (context, state) {
                        state.maybeWhen(
                            orElse: () => null,
                            success: (data) {
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
                          orElse: () => Align(
                            child: FilledAppButton(
                              width: double.maxFinite,
                              height: 45.h,
                              text: 'Submit',
                              onTap: () => _createArtisanProfile(),
                            ),
                          ),
                          loading: () => const Align(
                            child: CircularProgressIndicator(),
                          )
                        );
                      },
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

  Widget _buildCategoryField(BuildContext context) {
    return Ink(
      width: 200.w,
      height: 51.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: context.colors.onSurface),
      ),
      child: ValueListenableBuilder<ArtisanCategory?>(
          valueListenable: artisanCategory,
          builder: (context, value, child) {
            return DropdownButton<ArtisanCategory>(
              value: value,
              underline: const SizedBox.shrink(),
              isExpanded: true,
              items: ArtisanCategory.values
                  .map((category) => DropdownMenuItem<ArtisanCategory>(
                        value: category,
                        child: Text(category.category),
                      ))
                  .toList(),
              onChanged: (category) {
                if (category != null) {
                  artisanCategory.value = category;
                }
              },
              icon: const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(10.r),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Category',
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
          }),
    );
  }

  void _createArtisanProfile() {
    if (_formKey.currentState!.validate()) {
      final businessName = _businessNameController.text.trim();
      final occupation = _occupationController.text.trim();
      final state = _stateController.text.trim();
      final description = _businessDescriptionController.text.trim();
      final phoneNumber = widget.phoneNumber;

      final artisanBloc = BlocProvider.of<ArtisanBloc>(context);
      artisanBloc.add(
        CreateArtisanDocumentEvent(
            businessName: businessName,
            occupation: occupation,
            state: state,
            businessDescription: description,
            phone: phoneNumber,
            category: artisanCategory.value),
      );
    }
  }

  Widget _buildLevelOfExpertiseField(BuildContext context) {
    return Ink(
      width: 200.w,
      height: 51.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: context.colors.onSurface),
      ),
      child: ValueListenableBuilder<ExperienceLevel?>(
          valueListenable: artisanExperienceLevel,
          builder: (context, value, child) {
            return DropdownButton<ExperienceLevel>(
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
                if (level != null) {
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
          }),
    );
  }

  void _navigateToHome() {
    context.goNamed('user-home');
  }
}
