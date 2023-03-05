import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_message/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_bloc/user_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/mappers/chat_message_dto_to_chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_detail_model.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_model.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/chat/widgets/chat_message_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/avatar_widget.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({
    Key? key,
    this.chatId,
    this.userId,
  }) : super(key: key);

  final String? chatId;
  final String? userId;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  late final TextEditingController _messageController;
  String? chatId;

  @override
  void initState() {
    _messageController = TextEditingController();
    if (widget.chatId != null) {
      chatId = widget.chatId!;
      BlocProvider.of<ChatBloc>(context)
          .add(ChatEvent.fetchConversation(chatId!));
    }
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 13.w,
                top: 20.h,
              ),
              child: Column(
                children: [
                  Expanded(child: _buildConversationListView([])),
                  SizedBox(height: 8.h),
                  _buildMessageField(),
                  SizedBox(height: 13.h),
                ],
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (data) {
              final chatDetail = data as ChatDetailModel;
              chatId = chatId ?? chatDetail.chatId;
              return StreamBuilder(
                  stream: chatDetail.chatMessages,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final messageSnapshots = snapshot.data;
                      final messages =
                          messageSnapshots?.docs.map((dynamic docSnapshot) {
                        final conversation =
                            ChatMessageDto.fromJson(docSnapshot.data());
                        final chatMessage = conversation.toChatMessage();
                        return chatMessage;
                      }).toList();
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 13.w,
                          top: 20.h,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child:
                                    _buildConversationListView(messages ?? [])),
                            SizedBox(height: 8.h),
                            _buildMessageField(),
                            SizedBox(height: 13.h),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  });
            },
          );
        },
      ),
    );
  }

  Widget _buildMessageField() {
    return TextField(
      controller: _messageController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColours.purpleShadeThree,
            ),
            borderRadius: BorderRadius.circular(15.r)),
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
      textInputAction: TextInputAction.done,
      onSubmitted: (value) {
        sendMessage(value);
      },
    );
  }

  void sendMessage(String message) {
    final userId = BlocProvider.of<UserBloc>(context).userId;
    _messageController.text = '';
    if (chatId == null) {
      //final artisan = widget.artisan!;

      final chatMessage = ChatMessage(
        message: message,
        sender: userId,
        timeStamp: DateTime.now(),
      );
      final chatRoom = ChatModel(
        userOneName: '',
        userTwoName: '',
        userOneId: widget.userId!,
        userOneAvatar: '',
        userTwoId: userId,
        userTwoAvatar: '',
        recentMessage: message,
        timeStamp: DateTime.now(),
      );
      BlocProvider.of<ChatBloc>(context).add(
        ChatEvent.createChatRoom(chatRoom, chatMessage),
      );
    } else {
      final chatMessage = ChatMessage(
        message: message,
        sender: userId,
        timeStamp: DateTime.now(),
      );
      BlocProvider.of<ChatBloc>(context).add(
        ChatEvent.createNewMessage(chatId!, chatMessage),
      );
    }
  }

  Widget _buildConversationListView(List<ChatMessage> messages) {
    final userId = BlocProvider.of<UserBloc>(context).userId;
    return ListView.separated(
        itemCount: messages.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, _) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final message = messages[index];
          return message.sender != userId
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
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
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
