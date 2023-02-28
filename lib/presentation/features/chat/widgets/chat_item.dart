import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          chat.userAvatar,
          width: 60.w,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 4.w),
        Column(
          children: [
            Text(
              chat.name,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              chat.recentMessage,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Text('1hr'),
      ],
    );
  }
}
