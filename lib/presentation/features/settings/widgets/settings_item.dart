import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsItem extends StatelessWidget {
  SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.textStyle,
    this.onTapped,
    this.elevation = 0.0,
    double? verticalPadding,
    double? iconSize,
  })  : verticalPadding = verticalPadding ?? 8.h,
        iconSize = iconSize ?? 24.w;

  final String title;
  final String icon;
  final Color color;
  final VoidCallback? onTapped;
  final double elevation;
  double? verticalPadding;
  double? iconSize;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: ListTile(
        leading: Text(
          title,
          style: textStyle,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: verticalPadding!,
        ),
        tileColor: color,
        trailing: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            context.colors.onSurface,
            BlendMode.srcIn,
          ),
          width: iconSize,
        ),
        onTap: onTapped,
      ),
    );
  }
}
