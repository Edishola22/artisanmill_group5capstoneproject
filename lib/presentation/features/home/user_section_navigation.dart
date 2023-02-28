import 'package:artisanmill_group5capstoneproject/domain/models/nav_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';



class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, navIndex, child) {
        return BottomNavigationBar(
          items: NavItem.navItems
              .map(
                (navItem) => BottomNavigationBarItem(
                icon: SvgPicture.asset(navItem.iconPath),
                activeIcon: SvgPicture.asset(
                  navItem.iconPath,
                  colorFilter: const ColorFilter.mode(
                    AppColours.purpleShadeThree,
                    BlendMode.srcIn,
                  ),
                ),
                label: navItem.title),
          )
              .toList(),
          iconSize: 26.w,
          onTap: (index) =>_navigateToTab(context, index),
          currentIndex: navIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColours.purpleShadeOne,
          unselectedFontSize: 12.sp,
          selectedFontSize: 12.sp,
          selectedItemColor: AppColours.purpleShadeThree,
          unselectedItemColor: context.colors.onSurface,
          showUnselectedLabels: true,
        );
      }
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    if(index == _currentIndex.value) return;
    final location = NavItem.navItems[index].initialLocation;
    _currentIndex.value = index;
    context.go(location);
  }
}
