import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.chat,
    this.userId,
  }) : super(key: key);

  final ChatModel chat;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      child: Row(
        children: [
          Stack(children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(getChatUserProfileImage(context) ?? ''),
              radius: 30.w,
            ),
            Positioned(
              top: -1.h,
              right: 2.w,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.w,
                    )),
              ),
            )
          ]),
          SizedBox(width: 18.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getChatUserName(context) ?? '',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  chat.recentMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Text('1hr'),
        ],
      ),
    );
  }

  String? getChatUserProfileImage(BuildContext context) {
    return userId == chat.user.id ? chat.artisan.imageUrl: chat.user.imageUrl;
  }

  String? getChatUserName(BuildContext context) {
    return userId == chat.user.id ? chat.artisan.businessName: chat.user.name;
  }
}
