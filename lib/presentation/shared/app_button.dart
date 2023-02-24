import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        )
      ),
      child: Text(text),
    );
  }
}
