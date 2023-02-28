import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/widgets/chat_item.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          children: [
            _buildSearchField(),
            SizedBox(height: 24.h),
            Expanded(child: _buildChatItemList())
          ],
        ),
      ),
    );
  }

  Widget _buildChatItemList() {
    return ListView.builder(itemBuilder: (context, index) {
      return ChatItem(chat: ChatModel(
          name: '', recentMessage: '', timeStamp: DateTime.now()),);
    });
  }

  Widget _buildSearchField() {
    return SizedBox(
      height: 50.h,
      child: TextField(
          controller: _searchController,
          maxLines: 1,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                    color: AppColours.purpleShadeThree),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                    color: AppColours.purpleShadeThree),
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.icons.searchIcon.path,
                    width: 30.w,
                    height: 30.h,
                  ),
                  Divider(
                    thickness: 5.w,
                    height: double.infinity,
                    color: AppColours.purpleShadeThree,
                  )
                ],
              ),
              hintText: 'Search'
          )),
    );
  }
}
