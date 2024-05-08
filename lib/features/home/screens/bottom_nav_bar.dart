import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/features/Favorite_stores/screens/fav_view.dart';
import 'package:shopping_app/features/home/screens/home_view.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  final String userEmail;
  const BottomNavBar({super.key, required this.userEmail});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeView(userEmail: widget.userEmail),
      FavoriteView(userEmail: widget.userEmail),
      const Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 20, fontFamily: AppColors.kFontFamily),
        ),
      ),
      const Center(
        child: Text(
          "Settings",
          style: TextStyle(fontSize: 20, fontFamily: AppColors.kFontFamily),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontFamily: AppColors.kFontFamily,
    );
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: AppColors.primary,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          containerHeight: 64,
          showElevation: false,
          backgroundColor: Colors.transparent,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: const Icon(
                CupertinoIcons.home,
                size: 26,
              ),
              title: const Text(
                " Home",
                style: textStyle,
              ),
              activeColor: AppColors.white,
            ),
            BottomNavyBarItem(
              icon: const Icon(
                CupertinoIcons.heart,
                size: 26,
              ),
              title: const Text(
                " Favorites",
                style: textStyle,
              ),
              activeColor: AppColors.white,
            ),
            BottomNavyBarItem(
              icon: const Icon(
                CupertinoIcons.person_fill,
                size: 26,
              ),
              title: const Text(
                " Profile",
                style: textStyle,
              ),
              activeColor: AppColors.white,
            ),
            BottomNavyBarItem(
              icon: const Icon(
                CupertinoIcons.settings,
                size: 26,
              ),
              title: const Text(
                " Settings",
                style: textStyle,
              ),
              activeColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
