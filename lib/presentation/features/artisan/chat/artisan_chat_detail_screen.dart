import 'package:artisanmill_group5capstoneproject/data/helpers/shared_prefs_helper.dart';
import 'package:artisanmill_group5capstoneproject/data/models/chat_message/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/chat_bloc/chat_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/mappers/chat_message_dto_to_chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_detail_model.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_message.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_users.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/artisan/chat/widgets/chat_message_item.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ArtisanChatDetailScreen extends StatefulWidget {
  const ArtisanChatDetailScreen({
    Key? key,
    this.chatId,
    this.chatUsers,
  }) : super(key: key);

  final String? chatId;
  final ChatUsers? chatUsers;

  @override
  State<ArtisanChatDetailScreen> createState() =>
      _ArtisanChatDetailScreenState();
}

class _ArtisanChatDetailScreenState extends State<ArtisanChatDetailScreen> {
  late final TextEditingController _messageController;
  String? currentUserId;
  String? receiverName;
  String? receiverImageUrl;
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
    return  FutureBuilder(
        future: AppPreferences().getUserId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            currentUserId = snapshot.data;
            final chatUsers = widget.chatUsers;
            if (chatUsers?.user == null) {
              receiverName = chatUsers?.artisan?.businessName;
              receiverImageUrl = chatUsers?.artisan?.imageUrl;
            } else {
              receiverName = currentUserId == chatUsers?.user?.id
                  ? chatUsers?.artisan?.businessName
                  : chatUsers?.user?.name;

              receiverImageUrl = currentUserId == chatUsers?.user?.id
                  ? chatUsers?.artisan?.imageUrl
                  : chatUsers?.user?.imageUrl;
            }
            return Scaffold(
              appBar: _buildAppBar(context),
              body: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () =>
                        Padding(
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
                    loading: () =>
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (data) {
                      final chatDetail = data as ChatDetailModel;
                      chatId = chatId ?? chatDetail.chatId;
                      return StreamBuilder(
                          stream: chatDetail.chatMessages,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              final messageSnapshots = snapshot.data;
                              final messages = messageSnapshots?.docs
                                  .map((dynamic docSnapshot) {
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
                                        child: _buildConversationListView(
                                            messages ?? [])),
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
          } else {
            return Center(
              child: Text(
                'Error occurred',
                style: context.textTheme.titleMedium,
              ),
            );
          }
        },
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
    _messageController.text = '';
    if (chatId == null) {
      final chatMessage = ChatMessage(
        message: message,
        sender: currentUserId!,
        timeStamp: DateTime.now(),
      );

      final artisanId = widget.chatUsers!.artisan!.id!;
      BlocProvider.of<ChatBloc>(context).add(
        ChatEvent.createChatRoom(artisanId, chatMessage),
      );
    } else {
      final chatMessage = ChatMessage(
        message: message,
        sender: currentUserId!,
        timeStamp: DateTime.now(),
      );
      BlocProvider.of<ChatBloc>(context).add(
        ChatEvent.createNewMessage(chatId!, chatMessage),
      );
    }
  }

  Widget _buildConversationListView(List<ChatMessage> messages) {
    return ListView.separated(
        itemCount: messages.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, _) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final message = messages[index];
          return message.sender != currentUserId
              ? Align(
            alignment: Alignment.topLeft,
            child: ChatMessageItem(
              message: message,
              userId: currentUserId,
            ),
          )
              : Align(
            alignment: Alignment.topRight,
            child: ChatMessageItem(
              message: message,
              userId: currentUserId,
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
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(receiverImageUrl ?? ''),
            radius: 12.5.w,
          ),
          SizedBox(width: 4.w),
          Text(
            receiverName ?? '',
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
