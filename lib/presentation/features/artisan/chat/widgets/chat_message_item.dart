import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/avatar_widget.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatMessageItem extends StatelessWidget {
  ChatMessageItem({
    Key? key,
    required this.message,
    this.userId,
  }) : super(key: key);

  ChatMessage message;
  String? userId;

  @override
  Widget build(BuildContext context) {
    return message.sender != userId
        ? _buildReceiverContainer(context)
        : _buildSenderContainer(context);
  }

  Widget _buildReceiverContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColours.purpleShadeOne,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            radius: 8.5.r,
            imagePath: Assets.images.userProfileAvatar.path,
          ),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              message.message,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSenderContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColours.purpleShadeFour,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        message.message,
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
