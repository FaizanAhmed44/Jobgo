import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/application/screen/application.dart';
import 'package:jobgo/features/screen/auth/logic/auth_logic.dart';
import 'package:jobgo/features/screen/auth/screen/loginscreen.dart';
import 'package:jobgo/features/screen/edit_profile/screen/edit_profile.dart';
import 'package:jobgo/main.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  // DocumentSnapshot? user;

  @override
  void initState() {
    super.initState();
    // getUserDetail();
  }

  // Future<String> getOrCreateChat(String userId, String adminId) async {
  //   final chatCollection = FirebaseFirestore.instance.collection('chats');
  //   final querySnapshot =
  //       await chatCollection.where('participants', arrayContains: userId).get();

  //   for (final doc in querySnapshot.docs) {
  //     if (doc['participants'].contains(adminId)) {
  //       return doc.id; // Chat already exists
  //     }
  //   }

  //   final chatDoc = chatCollection.doc();
  //   await chatDoc.set({
  //     'chatId': chatDoc.id,
  //     'participants': [userId, adminId],
  //     'lastMessage': '',
  //     'lastTimestamp': Timestamp.now(),
  //   });
  //   return chatDoc.id;
  // }

  // void getUserDetail() async {
  //   DocumentSnapshot snap = await AuthMethods().getUserDetail();
  //   user = snap;
  //   setState(() {});
  // }

  Widget shimmerPlaceholder(
      double screenWidth, double screenHeight, TheamModal theamNotifier) {
    return Shimmer.fromColors(
      baseColor: theamNotifier.isDark
          ? mainDarkColor.withOpacity(0.2)
          : Colors.grey[300]!,
      highlightColor:
          theamNotifier.isDark ? Colors.grey[50]! : Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.10),
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.025,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              const Icon(FluentSystemIcons.ic_fluent_hand_raise_regular,
                  color: Color(0xFFFEC837)),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            width: screenWidth * 0.4,
            height: screenHeight * 0.03,
            color: Colors.black,
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.030,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.030,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.030,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.025,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.030,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.030,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.030,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.030,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.030,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.030,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.030,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.030,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ).px16(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        body:
            // user == null
            //     ? Center(
            //         child: shimmerPlaceholder(
            //             screenWidth, screenHeight, theamNotifier),
            //       )
            //     :
            Row(
          children: [
            SizedBox(
              height: screenHeight * 0.9,
              width: screenWidth * 0.63,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.09),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.15,
                        height: screenWidth * 0.15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("asset/images/person.jpg")),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Row(
                        children: [
                          "Hey, "
                              .text
                              .color(lightColor)
                              .size(screenWidth * 0.045)
                              .make()
                              .px4(),
                          const Icon(
                            FluentSystemIcons.ic_fluent_hand_raise_regular,
                            color: Color(0xFFFEC837),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      "Faizan Ahmed"
                          .toString()
                          .text
                          .bold
                          .color(theamNotifier.isDark
                              ? Colors.white
                              : Colors.black)
                          .size(screenWidth * 0.055)
                          .make()
                          .px4(),
                      SizedBox(height: screenHeight * 0.01),
                      "faizanahmed@gmail.com"
                          .toString()
                          .text
                          .color(lightColor)
                          .size(screenWidth * 0.04)
                          .make()
                          .px4(),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => const EditProfileScreen()))
                          .then((v) {
                        // getUserDetail();
                      });
                    },
                    child: _buildMenuOption(
                      icon: FluentSystemIcons.ic_fluent_person_filled,
                      label: "Edit Profile",
                      fontSize: screenWidth * 0.04,
                      theamNotifier: theamNotifier,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const JobApplicationsScreen()));
                    },
                    child: _buildMenuOption(
                      icon: FluentSystemIcons.ic_fluent_apps_list_filled,
                      label: "Applications",
                      fontSize: screenWidth * 0.04,
                      theamNotifier: theamNotifier,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const SettingScreen()));
                    },
                    child: _buildMenuOption(
                      icon: FluentSystemIcons.ic_fluent_settings_filled,
                      label: "Settings",
                      fontSize: screenWidth * 0.04,
                      theamNotifier: theamNotifier,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const CartScreen()));
                    },
                    child: _buildMenuOption(
                      icon: Icons.favorite,
                      label: "Favorite",
                      fontSize: screenWidth * 0.04,
                      theamNotifier: theamNotifier,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(thickness: 0.8, color: lightTextColor),
                      SizedBox(height: screenHeight * 0.028),
                      GestureDetector(
                        onTap: () {
                          AuthMethods().signOut();
                          box1.put('isLogedIn', false);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: _buildMenuOption(
                          icon: FluentSystemIcons.ic_fluent_sign_out_filled,
                          label: "Sign Out",
                          fontSize: screenWidth * 0.04,
                          theamNotifier: theamNotifier,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.08),
                    ],
                  ),
                ],
              ).pOnly(left: screenWidth * 0.07),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.only(
                top: screenHeight * 0.1,
                bottom: screenHeight * 0.06,
                right: 0,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 8,
                    // offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: theamNotifier.isDark
                  ? Image.asset(
                      "asset/images/profile_pic.png",
                      fit: BoxFit.fitHeight,
                    )
                  : Image.asset(
                      "asset/images/profile_pic.png",
                      fit: BoxFit.fitHeight,
                    ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String label,
    required double fontSize,
    required TheamModal theamNotifier,
  }) {
    return Row(
      children: [
        CircleAvatar(
            radius: 22,
            backgroundColor: theamNotifier.isDark
                ? lightTextColor.withOpacity(0.5)
                : Colors.grey.withOpacity(0.2),
            child: Icon(icon, color: mainColor).centered()),
        SizedBox(width: fontSize * 0.9),
        label.text.bold
            .color(theamNotifier.isDark ? Colors.white : Colors.black)
            .size(fontSize)
            .make()
            .pOnly(bottom: 5),
      ],
    );
  }
}
