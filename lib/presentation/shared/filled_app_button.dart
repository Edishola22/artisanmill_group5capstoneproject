import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledAppButton extends StatelessWidget {
  const FilledAppButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: color
      ),
      child: Text(
        text,
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}
