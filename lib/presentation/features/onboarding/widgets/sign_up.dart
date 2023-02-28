import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  void initState() {
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Email',
                    inputType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {},
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: 'Phone Number',
                    inputType: TextInputType.phone,
                    controller: _phoneController,
                    validator: (value) {},
                  ),
                  SizedBox(height: 24.h),
                  ValueListenableBuilder(
                      valueListenable: _isPasswordVisible,
                      builder: (context, isVisible, child) {
                        return CustomTextField(
                          label: 'Password',
                          inputType: null,
                          controller: _passwordController,
                          isPassword: true,
                          isPasswordVisible: isVisible,
                          onShowPassword: () {
                            _isPasswordVisible.value =
                                !_isPasswordVisible.value;
                          },
                          validator: (value) {},
                        );
                      }),
                  SizedBox(height: 48.h),
                  FilledAppButton(
                    width: 172.w,
                    height: 51.h,
                    text: 'Sign Up',
                    onTap: () => _navigateToChooseAccount(),
                  ),
                  SizedBox(height: 24.h),
                  const Text('Or'),
                  SizedBox(height: 32.h),
                  _buildSocialLoginRow(),
                  SizedBox(height: 32.h),
                  _buildSignInText(),
                  SizedBox(height: 42.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToChooseAccount() {
    context.goNamed('account-chooser');
  }

  Widget _buildSignInText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: FittedBox(
        fit: BoxFit.cover,
        child: RichText(
          text: TextSpan(
              text: 'Do you have an account already? ',
              style: context.textTheme.titleLarge,
              children: [
                TextSpan(
                    text: 'Sign In',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colors.secondary
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
        ),
      ),
    );
  }

  Widget _buildSocialLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          iconSize: 24.w,
          icon: Assets.icons.google.svg(),
        ),
        SizedBox(width: 40.w),
        IconButton(
          onPressed: () {},
          iconSize: 24.w,
          icon: Assets.icons.apple.svg(),
        ),
        SizedBox(width: 40.w),
        IconButton(
          onPressed: () {},
          iconSize: 24.w,
          icon: Assets.icons.facebook.svg(),
        ),
      ],
    );
  }
}
