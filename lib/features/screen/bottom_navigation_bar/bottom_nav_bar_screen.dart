import 'package:fluentui_icons/fluentui_icons.dart';

import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/application/screen/application.dart';
import 'package:jobgo/features/screen/home/screen/home_screen.dart';
import 'package:jobgo/features/screen/message/screen/message_screen.dart';
import 'package:jobgo/features/screen/profile/screen/profile_screen.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class CustomBottomNavBarUser extends StatefulWidget {
  const CustomBottomNavBarUser({super.key});

  @override
  State<CustomBottomNavBarUser> createState() => _CustomBottomNavBarUserState();
}

class _CustomBottomNavBarUserState extends State<CustomBottomNavBarUser> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor:
            theamNotifier.isDark ? darkColor : lightColorBackground,
        bottomNavigationBar: WaterDropNavBar(
          bottomPadding: 16,
          waterDropColor: mainColor,
          backgroundColor:
              theamNotifier.isDark ? mainDarkColor : lightColorBackground,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              filledIcon: FluentSystemIcons.ic_fluent_home_filled,
              outlinedIcon: FluentSystemIcons.ic_fluent_home_regular,
            ),
            BarItem(
              filledIcon: FluentSystemIcons.ic_fluent_chat_filled,
              outlinedIcon: FluentSystemIcons.ic_fluent_chat_regular,
            ),
            BarItem(
              filledIcon: FluentSystemIcons.ic_fluent_person_filled,
              outlinedIcon: FluentSystemIcons.ic_fluent_person_regular,
            ),
            BarItem(
              filledIcon: FluentSystemIcons.ic_fluent_settings_filled,
              outlinedIcon: FluentSystemIcons.ic_fluent_settings_regular,
            ),
          ],
        ).pOnly(bottom: 0),
        body: _getSelectedTab(selectedIndex),
      );
    });
  }

  Widget _getSelectedTab(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return ChatScreen();
      case 2:
        return const Profilescreen();
      case 3:
        return const JobApplicationsScreen();
      default:
        return const HomeScreen();
    }
  }
}
