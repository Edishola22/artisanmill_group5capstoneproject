import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/category_model.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/artisan_extension.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/app_logo.dart';

class UserHomeTab extends StatefulWidget {
  const UserHomeTab({Key? key, required}) : super(key: key);

  @override
  State<UserHomeTab> createState() => _UserHomeTabState();
}

class _UserHomeTabState extends State<UserHomeTab> {
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
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Image.asset(
                        Assets.images.cleaning.path,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 127.h,
                      ),
                    SizedBox(height: 21.h),
                    _buildSearchField(),
                    SizedBox(height: 14.h),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: _buildCategory(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 28.h),
              ),
              SliverToBoxAdapter(
                child: Text('Popular Services',
                    style:
                    context.textTheme.titleMedium?.copyWith(color: Colors.black)),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 6.h),
              ),
              _buildPopularServices(),
            ],
          ),
        )
        );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 26.w),
        child: AppLogo(),
      ),
      leadingWidth: 130.w,
      actions: [
        IconButton(
          onPressed: () => _navigateToSettings(context),
          iconSize: 32.w,
          icon: Assets.icons.hamburgerIcon.svg(),
        )
      ],
    );
  }

  Widget _buildPopularServices() {
    final categories = ArtisanCategory.values
        .map((cat) =>
            Category(title: cat.category, image: Assets.images.maintenace.path))
        .toList();

    return SliverGrid.builder(
      itemCount: categories.length,
      //   primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
       childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];


        return Container(
          decoration: const BoxDecoration(
           // borderRadius: BorderRadius.circular(10.r),
            color: AppColours.orangeLight,
          ),
         padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Flexible(
                child: Image.asset(
                  index % 2 == 0
                      ? Assets.images.mechanical.path
                      : category.image,
                  height: 180.h,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                category.title,
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategory() {
    final categories = ArtisanCategory.values
        .map((cat) =>
            Category(title: cat.category, image: Assets.images.maintenace.path))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Service Categories',
            style:
                context.textTheme.titleMedium?.copyWith(color: Colors.black)),
        SizedBox(height: 6.h),
        Container(
          height: 155.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColours.orangeLight,
          ),
          child: ListView.builder(
              itemCount: categories.length,
              primary: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      index % 2 == 0
                          ? Assets.images.mechanical.path
                          : category.image,
                      width: 134.w,
                      height: 104.h,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      category.title,
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

  Widget _buildSearchField() {
    return SizedBox(
      height: 50.h,
      child: TextField(
          controller: _searchController,
          maxLines: 1,
          onTap: () => _navigateToSearch(),
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
              hintText: 'Search by Location')),
    );
  }

  void _navigateToSearch() {
    context.read<UserNavigationBloc>().add(NavigateToSearchTabEvent());
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
