import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/bottom_navigation_bar/bottom_nav_bar_screen.dart';
import 'package:jobgo/features/screen/user_Comp_profile/screen/comp_prof_scr.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'asset/images/congrats.json', // Make sure to add an animation file
              height: 300,
              repeat: true,
            ),
            const SizedBox(height: 20),
            const Text(
              "🎉 Congratulations! 🎉",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: mainColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Your account has been successfully created. Now, complete your profile or start exploring job opportunities!",
              style: TextStyle(fontSize: 16, color: lightTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfessionalDetailsScreen(uid: ''),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                width: 270,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Add Professional Details",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ).centered(),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const CustomBottomNavBarUser()),
                  (route) => false,
                );
              },
              child: Container(
                width: 270,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Explore Jobs",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_search_filled,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
