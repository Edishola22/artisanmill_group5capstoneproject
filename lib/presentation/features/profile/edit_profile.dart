import 'package:artisanmill_group5capstoneproject/data/models/user/user.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_state.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserDto user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _nameController;
  late final TextEditingController _stateController;
  late final TextEditingController _countryController;
  late final UserDto user;

  @override
  void initState() {
    user = widget.user;
    _nameController = TextEditingController();
    _stateController = TextEditingController();
    _countryController = TextEditingController();
    _nameController.text = user.name ?? '';
    _stateController.text = user.state ?? '';
    _countryController.text == user.country ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        leading: const SizedBox.shrink(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Text(
              'Complete Your Profile',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 42.h),
            SizedBox(
              width: 75.w,
              height: 75.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      Assets.images.userProfileAvatar.path,
                    ),
                    radius: 30.w,
                  ),
                  Positioned(
                      bottom: 4.h,
                      right: -1.w,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                            color: context.colors.primary,
                            shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 16.w,
                          icon: const Icon(Icons.edit),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Name',
                      hintText: 'Enter your name',
                      controller: _nameController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Name required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 22.h),
                    CustomTextField(
                      label: 'State',
                      hintText: 'Enter your state',
                      controller: _stateController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'State required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 22.h),
                    CustomTextField(
                      label: 'Country',
                      hintText: 'Enter your country',
                      controller: _countryController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Country required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60.h),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () => null,
                  error: (message) => context.showErrorSnackBar(message),
                  success: (_) => context.pop(),
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => PlainAppButton(
                          width: 157.w,
                          height: 50.h,
                          text: 'Done',
                          onTap: () => updateUserDetails(),
                        ),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateUserDetails() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final state = _stateController.text.trim();
      final country = _countryController.text.trim();

      final userBloc = BlocProvider.of<UserBloc>(context);
      userBloc.add(UpdateUserDocumentEvent(
          user: user.copyWith(
        name: name,
        state: state,
        country: country,
      )));
    }
  }
}
