import 'package:artisanmill_group5capstoneproject/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_users.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/chat/widgets/chat_item.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ArtisanChatTab extends StatefulWidget {
  const ArtisanChatTab({Key? key}) : super(key: key);

  @override
  State<ArtisanChatTab> createState() => _ArtisanChatTabState();
}

class _ArtisanChatTabState extends State<ArtisanChatTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    final userId = BlocProvider.of<AuthBloc>(context).userId;
    BlocProvider.of<ChatBloc>(context).add(ChatEvent.fetchChatRooms(userId));
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
          'Chats',
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (chats) {
                final chatRooms = chats as List<ChatModel>;
                return chatRooms.isEmpty
                    ? Center(
                        child: Text(
                          'No chats yet',
                          style: context.textTheme.titleMedium,
                        ),
                      )
                    : Column(
                        children: [
                          _buildSearchField(),
                          SizedBox(height: 24.h),
                          Expanded(child: _buildChatItemList(chatRooms))
                        ],
                      );
              },
              error: (message) => Center(
                child: Text(
                  message,
                  style: context.textTheme.titleMedium,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildChatItemList(List<ChatModel> chats) {
    return ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, index) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final chat = chats[index];
          final chatUsers = ChatUsers(
            artisan: chat.artisan,
            user: chat.user,
          );
          return InkWell(
            onTap: () => _navigateToChatDetail(chat.id!, chatUsers),
            child: ChatItem(chat: chat),
          );
        });
  }

  void _navigateToChatDetail(String chatId, ChatUsers users) {
    context.goNamed(
      'artisan-chat-details',
      queryParams: {
        'chatId': chatId,
      },
      extra: users,
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      height: 50.h,
      child: TextField(
        controller: _searchController,
        maxLines: 1,
        onSubmitted: (value) {},
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: AppColours.purpleShadeThree),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: AppColours.purpleShadeThree),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 4.w),
                SvgPicture.asset(
                  Assets.icons.searchIcon.path,
                  width: 30.w,
                  height: 30.h,
                ),
                VerticalDivider(
                  thickness: 1.w,
                  color: AppColours.purpleShadeThree.withOpacity(0.6),
                )
              ],
            ),
            hintStyle: context.textTheme.bodyLarge,
            hintText: 'Search'),
      ),
    );
  }
}
