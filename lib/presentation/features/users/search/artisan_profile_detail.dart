import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/chat_users.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/search/widgets/search_app_bar.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/avatar_widget.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/filled_app_button.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/plain_app_button.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ArtisanProfileDetails extends StatefulWidget {
  const ArtisanProfileDetails({Key? key, required this.userId})
      : super(key: key);

  final String userId;

  @override
  State<ArtisanProfileDetails> createState() => _ArtisanProfileDetailsState();
}

class _ArtisanProfileDetailsState extends State<ArtisanProfileDetails> {
  late ArtisanDto artisan;

  @override
  void initState() {
    BlocProvider.of<ArtisanBloc>(context)
        .add(FetchArtisanProfileEvent(artisanId: widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onBackPressed: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<ArtisanBloc, ArtisanState>(
          builder: (context, state) {
            return state.when(
              uninitiated: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (data) {
                artisan = data as ArtisanDto;

                return Column(
                  children: [
                    _buildAvatar(context),
                    SizedBox(height: 8.h),
                    Text(
                      artisan.businessName ?? '',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildMessageButton(context),
                    SizedBox(height: 8.h),
                    _buildRatingRow(context),
                    SizedBox(height: 16.h),
                    _buildLocationContainer(context),
                    SizedBox(height: 16.h),
                    _buildDescriptionContainer(context),
                    SizedBox(height: 16.h),
                    _buildSocialsContainer(
                      context: context,
                      icon: Assets.icons.mail.path,
                      text: artisan.email ?? '',
                    ),
                    SizedBox(height: 16.h),
                    _buildSocialsContainer(
                      context: context,
                      icon: Assets.icons.web.path,
                      text: 'artisansmill.org',
                    ),
                    SizedBox(height: 16.h),
                    _buildSocialsContainer(
                      context: context,
                      icon: Assets.icons.phone.path,
                      text: artisan.phoneNumber ?? '',
                    ),
                    SizedBox(height: 16.h),
                    _buildCatalog(context),
                    SizedBox(height: 16.h),
                    _buildReview(context),
                    SizedBox(height: 16.h),
                    FilledAppButton(
                      width: double.maxFinite,
                      height: 45.h,
                      text: 'Book Now',
                      onTap: () {},
                    ),
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

  Widget _buildMessageButton(BuildContext context) {
    final chatUsers = ChatUsers(artisan: artisan, user: null);
    return PlainAppButton(
      width: 120.w,
      height: 45.h,
      text: 'Message',
      onTap: () {
        context.goNamed(
          'user-chat-details',
          queryParams: {
            'userId': artisan.id,
          },
          extra: chatUsers,
        );
      },
    );
  }

  Widget _buildReview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review',
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColours.orangeLight,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AvatarWidget(
                    radius: 13.w,
                    imagePath: Assets.images.userProfileAvatar.path,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Shaddy Baby',
                    style: context.textTheme.bodyMedium,
                  )
                ],
              ),
              SizedBox(height: 12.h),
              _buildRatingBar(
                rating: 5,
                color: context.colors.secondary,
                iconSize: 10.w,
              ),
              SizedBox(height: 8.h),
              Text(
                'I love that Tara’s touch is super clean with their work. I wore my make up for a very long time and it didn’t smear one bit.',
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'See More',
            style: context.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }

  Widget _buildCatalog(BuildContext context) {
    final catalog = [
      'https://firebasestorage.googleapis.com/v0/b/artisan-mill.appspot.com/o/artisans%2Ftara_touch.png?alt=media&token=ab31fbc3-4d15-4a73-9fa4-151bc3fd7997',
      'https://firebasestorage.googleapis.com/v0/b/artisan-mill.appspot.com/o/artisans%2Ftara_touch.png?alt=media&token=ab31fbc3-4d15-4a73-9fa4-151bc3fd7997',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Catalog',
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.black)),
        SizedBox(height: 6.h),
        Container(
          height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColours.orangeLight,
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
          child: ListView.builder(
              itemCount: catalog.length,
              primary: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = catalog[index];
                return CachedNetworkImage(
                  imageUrl: item,
                  width: 150.w,
                  height: 145.h,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.withOpacity(0.5),
                    width: 150.w,
                    height: 145.h,
                  ),
                  errorWidget: (context, url, child) => Container(
                    color: Colors.grey.withOpacity(0.5),
                    width: 150.w,
                    height: 145.h,
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildLocationContainer(BuildContext context) {
    return Container(
      width: 140.w,
      height: 44.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColours.purpleShadeFive),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.location.path,
            width: 24.w,
          ),
          SizedBox(width: 4.w),
          Text(
            artisan.state ?? '',
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialsContainer({
    required BuildContext context,
    required String icon,
    required String text,
  }) {
    return _buildOutlinedContainer(
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 32.w,
          ),
          const Spacer(),
          Text(
            text,
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionContainer(BuildContext context) {
    return _buildOutlinedContainer(
      child: Text(
        artisan.businessDescription ?? '',
        style: context.textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildRatingRow(BuildContext context) {
    return _buildOutlinedContainer(
        child: Row(
      children: [
        Text(
          'Professional',
          style: context.textTheme.bodyLarge,
        ),
        const Spacer(),
        _buildRatingBar(
          rating: 4,
          color: context.colors.primary,
          iconSize: 32.w,
        ),
      ],
    ));
  }

  Widget _buildRatingBar({
    required double rating,
    required Color color,
    required double iconSize,
  }) {
    return RatingBar(
      initialRating: rating,
      itemCount: 5,
      itemSize: iconSize,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: color,
        ),
        half: Icon(
          Icons.star_half,
          color: color,
        ),
        empty: Icon(
          Icons.star,
          color: color.withOpacity(0.5),
        ),
      ),
      onRatingUpdate: (_) {},
    );
  }

  Widget _buildOutlinedContainer({required Widget child, double? width}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColours.purpleShadeThree,
            width: 0.5.w,
          ),
          borderRadius: BorderRadius.circular(10.r)),
      width: width,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
      child: child,
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Stack(children: [
      AvatarWidget(
        radius: 51.w,
        imagePath: Assets.images.userProfileAvatar.path,
      ),
      Positioned(
        bottom: 6.h,
        right: 2.w,
        child: Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: context.colors.primary),
        ),
      )
    ]);
  }
}
