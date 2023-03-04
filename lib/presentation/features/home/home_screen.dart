import 'package:artisanmill_group5capstoneproject/data/models/artisan/artisan.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/navigation_bloc/navigation_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/category_model.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/nav_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/assets/assets.gen.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/artisan_extension.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../shared/app_logo.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key, required}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
        padding: EdgeInsets.symmetric(horizontal: 25.w),
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
            _buildCategory(),
            SizedBox(height: 28.h),
            Expanded(child: _buildPopularServices()),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 26.w),
        child: const AppLogo(),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Service Categories',
            style:
            context.textTheme.titleMedium?.copyWith(color: Colors.black)),
        SizedBox(height: 6.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColours.orangeLight,
            ),
            child: GridView.builder(
              itemCount: categories.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6.h,
                childAspectRatio: 1.0,
                crossAxisSpacing: 6.w,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];

                return Column(
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
                );
              },
            ),
          ),
        ),
      ],
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
    context.read<NavigationBloc>()
        .add(NavigateToSearchTabEvent());
  }

  void _navigateToSettings(BuildContext context) {
    context.pushNamed('settings');
  }
}
