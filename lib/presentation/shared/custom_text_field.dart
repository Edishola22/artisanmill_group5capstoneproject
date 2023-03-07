import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    this.inputType,
    this.isPassword = false,
    this.onShowPassword,
    this.isPasswordVisible,
    this.hintText,
    this.label,
    this.inputFormatters,
    this.maxLines = 1,
  }) : super(key: key);

  final String? label;
  final bool isPassword;
  final TextEditingController controller;
  final VoidCallback? onShowPassword;
  final String? Function(String? text) validator;
  final bool? isPasswordVisible;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null) Text(
          label!,
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColours.grayShade),
            ),
            hintText: hintText,
            hintStyle: context.textTheme.bodyLarge,
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: onShowPassword,
                    icon: isPasswordVisible!
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  )
                : null,
          ),
          obscureText: isPassword ? !isPasswordVisible! : false,
          validator: validator,
        ),
      ],
    );
  }
}
