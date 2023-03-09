import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _emailController;
  late final TextEditingController _usernameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
    _usernameController = TextEditingController();
    BlocProvider.of<AuthBloc>(context).add(
        ResetAuthEvent()
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 36.w, right: 36.w, top: 40.h),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 36.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _usernameController,
                      hintText: 'Enter Your Username',
                      inputType: TextInputType.name,
                      validator: (value) {},
                    ),
                    SizedBox(height: 28.h),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Enter Your Email',
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Email required';
                        } else if (!value.contains('@')) {
                          return 'Not a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 28.h),
                    CustomTextField(
                      controller: _phoneController,
                      hintText: 'Enter Your Phone Number',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Phone number required';
                        } else if (value.length < 10) {
                          return 'Not a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 28.h),
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
                            validator: (value) {
                              if (value!.trim().length < 7) {
                                return 'Password must be at least 7 characters long';
                              }
                              return null;
                            },
                          );
                        }),
                    SizedBox(height: 28.h),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () => null,
                          authenticatedUnknown: () {
                            context.showSuccessSnackBar(
                              'Account created successfully!',
                            );
                            _navigateToChooseAccount();
                          },
                          error: (message) =>
                              context.showErrorSnackBar(message),
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => FilledAppButton(
                            width: double.maxFinite,
                            height: 48.h,
                            text: 'Sign Up',
                            onTap: () => _createAccount(),
                          ),
                          loading: () => const CircularProgressIndicator(),
                        );
                      },
                    ),
                    SizedBox(height: 32.h),
                    _buildDividerRow(context),
                    SizedBox(height: 23.h),
                    _buildFacebookLoginButton(onTap: () {}),
                    SizedBox(height: 23.h),
                    _buildGoogleLoginButton(onTap: () => _signInWithGoogleAccount()),
                    SizedBox(height: 30.h),
                    _buildLoginText(),
                    SizedBox(height: 30.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createAccount() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final authBloc = BlocProvider.of<AuthBloc>(context);
      authBloc.add(
        CreateAccountWithEmailAndPasswordEvent(
          email: email,
          password: password,
        ),
      );
    }
  }

  Widget _buildDividerRow(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: Colors.black,
        )),
        SizedBox(width: 6.w),
        Text(
          'Or With',
          style: context.textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
        ),
        SizedBox(width: 6.w),
        const Expanded(
            child: Divider(
          color: Colors.black,
        )),
      ],
    );
  }

  Widget _buildFacebookLoginButton({required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColours.blueShade,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fixedSize: Size(double.maxFinite, 48.h),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.images.facebookColoredLogo.path,
            width: 26.w,
          ),
          const Spacer(),
          Text(
            'Signup with Facebook',
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _signInWithGoogleAccount() {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(GoogleSignInEvent());
  }

  Widget _buildGoogleLoginButton({required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.surface,
          fixedSize: Size(double.maxFinite, 48.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: Colors.black.withOpacity(0.4),
              ))),
      child: Row(
        children: [
          Image.asset(
            Assets.images.googleColoredLogo.path,
            width: 26.w,
          ),
          const Spacer(),
          Text(
            'Signup with Google',
            style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _navigateToChooseAccount() {
    final phoneNumber = _phoneController.text.trim();
    context.goNamed('account-chooser', queryParams: {'phone': phoneNumber});
  }

  Widget _buildLoginText() {
    return FittedBox(
      fit: BoxFit.cover,
      child: RichText(
        text: TextSpan(
            text: 'Already have an account?  ',
            style: context.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: 'Login',
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: AppColours.blueShadeTwo),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _navigateToLogin(),
              ),
            ]),
      ),
    );
  }

  void _navigateToLogin() {
    context.goNamed('login');
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Create an account',
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 7.h),
        Text(
          'Connect with your friends today!',
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
