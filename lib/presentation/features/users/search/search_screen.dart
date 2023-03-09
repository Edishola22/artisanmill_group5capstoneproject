import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/artisan_bloc/artisan_state.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/all_artisans.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/presentation/features/users/search/widgets/search_app_bar.dart';
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
  const SearchTab({Key? key, this.location,}) : super(key: key);

  final String? location;

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    final location = widget.location;
    _searchController = TextEditingController();
    final artisanBloc = BlocProvider.of<ArtisanBloc>(context);
   if(location != 'null') {
     dev.log('Fetchby location called');
     artisanBloc.add(FetchAllArtisansByLocationEvent(location: location!));
   } else {
     dev.log('FetchAll called');
     artisanBloc.add(FetchAllArtisansEvent());
   }
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
      appBar: SearchAppBar(
        onBackPressed: _navigateToHome,
      ),
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
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ArtisanBloc, ArtisanState>(
                builder: (context, state) {
                  return state.when(
                      uninitiated: () => const SizedBox.shrink(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (data) {
                          if(data != null) {
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
                                      : _buildArtisanCategory(
                                    title: 'Painters',
                                    artisans: allArtisans.painters,
                                  ),
                                  SizedBox(height: 16.h),
                                  allArtisans.hairStylists.isEmpty
                                      ? const SizedBox.shrink()
                                      : _buildArtisanCategory(
                                    title: 'Hair Stylists',
                                    artisans: allArtisans.hairStylists,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
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

  void _navigateToArtisanProfile(String artisanId) {
    context.goNamed(
      'user-artisan-profile',
      params: {
        'id': artisanId
      }
    );
  }

  Widget _buildArtisanCategory({
    required String title,
    required List<ArtisanDto> artisans,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium?.copyWith(color: Colors.black),
        ),
        SizedBox(height: 6.h),
        Container(
          height: 190.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColours.orangeLight,
          ),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: ListView.separated(
              itemCount: artisans.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 4.w);
              },
              itemBuilder: (context, index) {
                final artisan = artisans[index];
                return InkWell(
                  onTap: () => _navigateToArtisanProfile(artisan.id ?? 'a'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: artisan.imageUrl ?? '',
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
                        ),
                      ),
                      SizedBox(height: 4.h),
                      FittedBox(
                        child: Text(
                          artisan.businessName ?? '',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  void _navigateToHome() {
    context
        .read<UserNavigationBloc>()
        .add(NavigateToHomeTabEvent());
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
            hintText: 'Search by Service'),
      ),
    );
  }
}
