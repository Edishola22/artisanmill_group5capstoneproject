import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_state.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/onboarding/widgets/auth_header.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/custom_text_field.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _rememberMe = ValueNotifier(true);

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    BlocProvider.of<AuthBloc>(context).add(
      ResetAuthEvent()
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              const AuthHeader(),
              SizedBox(height: 57.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Email',
                      controller: _emailController,
                      hintText: 'example@gmail.com',
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
                    SizedBox(height: 20.h),
                    ValueListenableBuilder(
                        valueListenable: _isPasswordVisible,
                        builder: (context, isVisible, child) {
                          return CustomTextField(
                            label: 'Password',
                            controller: _passwordController,
                            isPassword: true,
                            isPasswordVisible: isVisible,
                            onShowPassword: () {
                              _isPasswordVisible.value =
                                  !_isPasswordVisible.value;
                            },
                            hintText: 'Enter Your Password',
                            validator: (value) {
                              if (value!.trim().length < 7) {
                                return 'Password must be at least 7 characters long';
                              }
                              return null;
                            },
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: _rememberMe,
                      builder: (context, rememberMe, child) {
                        return CheckboxListTile(
                          value: rememberMe,
                          onChanged: (newValue) {
                            _rememberMe.value = newValue!;
                          },
                          dense: true,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          checkColor: context.colors.onSurface,
                          activeColor: Colors.transparent,
                          visualDensity: VisualDensity.compact,
                          title: Text(
                            'Remember Me',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'Forgot password',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontSize: 15.sp, color: AppColours.redShade),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () => null,
                    authenticatedUser: () => _navigateToUserHome(),
                    authenticatedUnknown: () {
                      _navigateToChooseAccount();
                    },
                    authenticatedArtisan: () => _navigateToArtisanHome(),
                    error: (message) => context.showErrorSnackBar(message),
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => FilledAppButton(
                      width: double.maxFinite,
                      height: 48.h,
                      text: 'Login',
                      onTap: () => _loginUser(),
                    ),
                    loading: () => const CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(height: 60.h),
              _buildDividerRow(context),
              SizedBox(height: 30.h),
              _buildFacebookLoginButton(onTap: () {}),
              SizedBox(height: 20.h),
              _buildGoogleLoginButton(onTap: () => _signInWithGoogleAccount()),
              SizedBox(height: 30.h),
              _buildSignUpText(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final authBloc = BlocProvider.of<AuthBloc>(context);
      authBloc.add(
        LoginAuthEvent(
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
            'Login with Facebook',
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
            'Login with Google',
            style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return FittedBox(
      fit: BoxFit.cover,
      child: RichText(
        text: TextSpan(
            text: 'Don\'t have an account? ',
            style: context.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: 'Sign Up',
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: AppColours.purpleShadeSix),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _navigateToSignUp(),
              ),
            ]),
      ),
    );
  }

  void _navigateToChooseAccount() {
    context.goNamed('account-chooser');
  }


  void _navigateToSignUp() {
    context.goNamed('register');
  }

  void _navigateToUserHome() {
    context.goNamed('user-home');
  }

  void _navigateToArtisanHome() {
    context.goNamed('artisan-home');
  }
}
