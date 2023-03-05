import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/widgets/chat_message_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/avatar_widget.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  final String chatId;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 13.w,
          top: 20.h,
        ),
        child: Column(
          children: [
            Expanded(child: _buildConversationListView()),
            SizedBox(height: 8.h),
            _buildMessageField(),
            SizedBox(height: 13.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageField() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        border:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColours.purpleShadeThree,
          ),
          borderRadius: BorderRadius.circular(15.r)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColours.purpleShadeThree,
            ),
            borderRadius: BorderRadius.circular(15.r),
        ),
        prefixIcon: Icon(
          Icons.emoji_emotions_outlined,
          size: 33.w,
          color: Colors.black,
        ),
        suffixIcon: Container(
          width: 33.w,
          height: 33.h,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            Assets.icons.paperclip.path,
          ),
        ),
      ),
      maxLines: 3,
      minLines: 1,
      onSubmitted: (value) {

      },

    );
  }

  Widget _buildConversationListView() {
    final messages = ChatMessage.messages;
    return ListView.separated(
        itemCount: messages.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, _) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final message = messages[index];
          return message.sender == 'A'
              ? Align(
                  alignment: Alignment.topLeft,
                  child: ChatMessageItem(message: message),
                )
              : Align(
                  alignment: Alignment.topRight,
                  child: ChatMessageItem(
                    message: message,
                  ),
                );
        });
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColours.purpleShadeFive,
      leadingWidth: 20.w,
      title: Row(
        children: [
          AvatarWidget(
            radius: 12.5.w,
            imagePath: Assets.images.userProfileAvatar.path,
          ),
          SizedBox(width: 4.w),
          Text(
            'Kate Peters',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
