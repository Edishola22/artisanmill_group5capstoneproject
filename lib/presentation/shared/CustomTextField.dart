import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
    this.inputType,
    this.isPassword = false,
    this.onShowPassword,
    this.isPasswordVisible,
  }) : super(key: key);

  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final VoidCallback? onShowPassword;
  final String? Function(String? text) validator;
  final bool? isPasswordVisible;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4.h),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: controller,
            maxLines: 1,
            keyboardType: inputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: context.colors.onSurface),
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: onShowPassword,
                      icon: isPasswordVisible!
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    )
                  : null,
            ),
            obscureText: isPassword ? !isPasswordVisible!: false,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
