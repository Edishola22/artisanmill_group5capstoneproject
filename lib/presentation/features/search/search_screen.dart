import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/navigation_bloc/navigation_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/all_artisans.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/shared/app_logo.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:developer' as dev;

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    final artisanBloc = BlocProvider.of<ArtisanBloc>(context);
    artisanBloc.add(FetchAllArtisansEvent());
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
      appBar: _buildAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchField(),
            SizedBox(height: 20.h),
            Text(
              'Services Near You',
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: BlocBuilder<ArtisanBloc, ArtisanState>(
                builder: (context, state) {
                  return state.when(
                      uninitiated: () => const SizedBox.shrink(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (data) {
                        final allArtisans = data as AllArtisans;
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              allArtisans.makeupArtist.isEmpty
                                  ? const SizedBox.shrink()
                                  : _buildArtisanCategory(
                                      title: 'Makeup Artists',
                                      artisans: allArtisans.makeupArtist,
                                    ),
                              SizedBox(height: 16.h),
                              allArtisans.mechanics.isEmpty
                                  ? const SizedBox.shrink()
                                  : _buildArtisanCategory(
                                      title: 'Mechanics',
                                      artisans: allArtisans.mechanics,
                                    ),
                              SizedBox(height: 16.h),
                              allArtisans.painters.isEmpty
                                  ? const SizedBox.shrink()
                                  :_buildArtisanCategory(
                                title: 'Painters',
                                artisans: allArtisans.painters,
                              ),
                              SizedBox(height: 16.h),
                              allArtisans.hairStylists.isEmpty
                                  ? const SizedBox.shrink()
                                  :_buildArtisanCategory(
                                title: 'Hair Stylists',
                                artisans: allArtisans.hairStylists,
                              ),
                            ],
                          ),
                        );
                      },
                      error: (message) => const SizedBox.shrink());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildArtisanCategory({
    required String title,
    required List<ArtisanDto> artisans,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                context.textTheme.titleMedium?.copyWith(color: Colors.black)),
        SizedBox(height: 6.h),
        Container(
          height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColours.orangeLight,
          ),
          child: ListView.separated(
              itemCount: artisans.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 4.w);
              },
              itemBuilder: (context, index) {
                final artisan = artisans[index];
                dev.log("image url is ${artisan.imageUrl}");
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl: artisan.imageUrl ?? '',
                        width: 120.w,
                        height: 140.h,
                        placeholder: (context, url) => Container(
                          color: Colors.grey,
                          width: 120.w,
                          height: 140.h,
                        ),
                        errorWidget: (context, url, child) => Container(
                          color: Colors.grey,
                          width: 120.w,
                          height: 140.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      artisan.businessName ?? '',
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 40),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: const AppLogo(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => _navigateToSettings(context),
                    iconSize: 32.w,
                    icon: Assets.icons.hamburgerIcon.svg(),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<NavigationBloc>()
                          .add(NavigateToHomeTabEvent());
                    },
                    iconSize: 32.w,
                    icon: Assets.icons.backIcon.svg(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
                borderSide:
                    const BorderSide(color: AppColours.purpleShadeThree),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:
                    const BorderSide(color: AppColours.purpleShadeThree),
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
                  Divider(
                    thickness: 5.w,
                    height: double.infinity,
                    color: AppColours.purpleShadeThree,
                  )
                ],
              ),
              hintStyle: context.textTheme.bodyLarge,
              hintText: 'Search by Service')),
    );
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
