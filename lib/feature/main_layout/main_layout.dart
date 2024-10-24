import 'package:ecommercee/core/resources/assets_managet.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/widget/custom_elevated_button.dart';
import 'package:ecommercee/core/widget/search_app_bar.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/favorite_tab.dart';
import 'package:ecommercee/feature/main_layout/home_screen/home_screen.dart';
import 'package:ecommercee/feature/main_layout/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories/categories.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    Categories(),
    FavoriteTab(),
    profile_tab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => changeSelectedIndex(value),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: ColorManager.white,
            unselectedItemColor: ColorManager.primary,
            backgroundColor: ColorManager.primary,
            type: BottomNavigationBarType.fixed,
            items: [
              CustomeBottomNavigationBar('Home', iconPath: ImageAssets.home),
              CustomeBottomNavigationBar('Categoreis',
                  iconPath: ImageAssets.categories),
              CustomeBottomNavigationBar('Favourite',
                  iconPath: ImageAssets.favourite),
              CustomeBottomNavigationBar('Profile',
                  iconPath: ImageAssets.profile),
            ]),
      ),
    );
  }

  void changeSelectedIndex(int newIndex) {
    currentIndex = newIndex;
    setState(() {});
  }
}

class CustomeBottomNavigationBar extends BottomNavigationBarItem {
  String title;

  String iconPath;

  CustomeBottomNavigationBar(this.title, {required this.iconPath})
      : super(
            label: title,
            icon: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.white,
            ),
            activeIcon: CircleAvatar(
                backgroundColor:
                    ColorManager.white, // Background of active icon
                child: ImageIcon(
                  AssetImage(iconPath),
                  color: ColorManager.primary,
                )));
}
