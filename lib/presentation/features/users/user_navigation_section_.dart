import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_bloc.dart';
import 'package:artisanmill_group5capstoneproject/domain/blocs/user_navigation_bloc/user_navigation_event.dart';
import 'package:artisanmill_group5capstoneproject/domain/models/user_nav_item.dart';
import 'package:artisanmill_group5capstoneproject/presentation/app_theme/app_colours.dart';
import 'package:artisanmill_group5capstoneproject/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class UserScaffoldWithNavBar extends StatefulWidget {
  const UserScaffoldWithNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<UserScaffoldWithNavBar> createState() => _UserScaffoldWithNavBarState();
}

class _UserScaffoldWithNavBarState extends State<UserScaffoldWithNavBar> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BlocConsumer<UserNavigationBloc, int>(
      listener: (context, state) {
        _navigateToTab(context, state);
      },
      builder: (context, state) {
        return BottomNavigationBar(
          items: UserNavItem.navItems
              .map(
                (navItem) =>
                BottomNavigationBarItem(
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
          onTap: (index) {
            UserNavigationEvent event;
            switch(index) {
              case 0:
                event = NavigateToHomeTabEvent();
                break;
              case 1:
                event = NavigateToChatTabEvent();
                break;
              case 2:
                event = NavigateToSearchTabEvent();
                break;
              case 3:
                event = NavigateToCalendarTabEvent();
                break;
              case 4:
                event = NavigateToProfileTabEvent();
                    break;
              default:
                throw Exception('Not a valid index');

            }
            context.read<UserNavigationBloc>()
                .add(event);
          },
          currentIndex: state,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColours.purpleShadeOne,
          unselectedFontSize: 12.sp,
          selectedFontSize: 12.sp,
          selectedItemColor: AppColours.purpleShadeThree,
          unselectedItemColor: context.colors.onSurface,
          showUnselectedLabels: true,
        );
      },
    );
  }

  void _navigateToTab(BuildContext context, int index) {
    if (index == _currentIndex.value) return;
    final location = UserNavItem.navItems[index].initialLocation;
    _currentIndex.value = index;
    context.go(location);
  }
}
