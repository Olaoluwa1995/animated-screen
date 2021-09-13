import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTabTapped;
  

  const BottomNav(this.currentIndex, this.onTabTapped);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/bulb.svg',
            width: 30,
            height: 30,
          ),
          label: "Rooms"
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon-feather-home.svg',
            width: 30,
            height: 30,
          ),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icon-feather-settings.svg',
            width: 30,
            height: 30,
          ),
          label: "Settings"
        ),
      ],
    );
  }
}
