import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/features/Favorite_stores/screens/fav_view.dart';
import 'package:shopping_app/features/home/screens/home_view.dart';
import 'package:shopping_app/units/constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const FavoriteView(),
    const Center(child: Text("Location")),
  ];

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
                CupertinoIcons.location,
                size: 26,
              ),
              title: const Text(
                " Location",
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
