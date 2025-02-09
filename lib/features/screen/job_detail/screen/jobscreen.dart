import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/job_apply/screen/job_apply_screen.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage({super.key});

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor:
            theamNotifier.isDark ? darkColor : lightColorBackground,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const JobApplyPage()));
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.71,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: mainColor,
                ),
                child: const Center(
                  child: Text(
                    "Apply Now",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(13),
              child: const Icon(Icons.chat, color: Colors.white),
            ),
          ],
        ).pOnly(left: 35),
        appBar: AppBar(
          backgroundColor: theamNotifier.isDark ? mainColor : mainColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: theamNotifier.isDark ? Colors.white : Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         width: 65,
            //         height: 65,
            //         child: Image.asset("asset/images/fb_logo.png"),
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "UI Design Lead",
            //         style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             color:
            //                 theamNotifier.isDark ? Colors.white : Colors.black),
            //       ),
            //       const SizedBox(height: 12),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "Spotify",
            //             style: TextStyle(
            //                 fontSize: 15,
            //                 fontWeight: FontWeight.bold,
            //                 color: theamNotifier.isDark
            //                     ? Colors.white
            //                     : Colors.black),
            //           ),
            //           const SizedBox(width: 7),
            //           Container(
            //             height: 3,
            //             width: 18,
            //             decoration: BoxDecoration(
            //               color: theamNotifier.isDark
            //                   ? Colors.white
            //                   : Colors.black,
            //               borderRadius: BorderRadius.circular(5),
            //             ),
            //           ),
            //           const SizedBox(width: 10),
            //           const Icon(FluentSystemIcons.ic_fluent_location_regular,
            //               size: 20, color: lightTextColor),
            //           const SizedBox(width: 3),
            //           const Text(
            //             "Toronto Canada",
            //             style: TextStyle(fontSize: 14, color: lightTextColor),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),

            // // Job Info
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Row(
            //       children: [
            //         Icon(Icons.access_time, color: lightTextColor),
            //         SizedBox(width: 5),
            //         Text(
            //           "Full Time",
            //           style: TextStyle(fontSize: 14, color: lightTextColor),
            //         ),
            //       ],
            //     ),
            //     const SizedBox(width: 70),
            //     Text(
            //       "\$1200/m",
            //       style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           color:
            //               theamNotifier.isDark ? Colors.white : Colors.black),
            //     ),
            //   ],
            // ),

            // const SizedBox(height: 20),

            // SizedBox(
            //   height: 50,
            //   child: TabBar(
            //       isScrollable: false,
            //       dividerHeight: 0,
            //       indicator: const BoxDecoration(
            //         color: Colors
            //             .transparent, // No underline or box for selected tab
            //       ),
            //       controller: _tabController,
            //       tabs: [
            //         _buildTab(
            //             "Description", _selectedIndex == 0, theamNotifier),
            //         _buildTab("Company", _selectedIndex == 1, theamNotifier),
            //       ]),
            // ),

            Container(
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                image: DecorationImage(
                    image: AssetImage('asset/images/1.png'), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 65,
                          height: 65,
                          child: Image.asset("asset/images/fb_logo.png"),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "UI Design Lead",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w900,
                              color: theamNotifier.isDark
                                  ? Colors.white
                                  : Colors.white),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Spotify",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: theamNotifier.isDark
                                      ? Colors.white
                                      : Colors.white),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              height: 3,
                              width: 18,
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? Colors.white
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                                FluentSystemIcons.ic_fluent_location_regular,
                                size: 20,
                                color: lightColorBackground),
                            const SizedBox(width: 3),
                            const Text(
                              "Toronto Canada",
                              style: TextStyle(
                                  fontSize: 14, color: lightColorBackground),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Job Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.3)),
                        child: const Row(
                          children: [
                            Icon(Icons.access_time,
                                color: lightColorBackground),
                            SizedBox(width: 5),
                            Text(
                              "Full Time",
                              style: TextStyle(
                                  fontSize: 14, color: lightColorBackground),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.3)),
                        child: Text(
                          "\$1200/m",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: theamNotifier.isDark
                                  ? Colors.white
                                  : Colors.white),
                        ).centered(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 50,
                    child: TabBar(
                        isScrollable: false,
                        dividerHeight: 0,
                        indicator: const BoxDecoration(
                          color: Colors
                              .transparent, // No underline or box for selected tab
                        ),
                        controller: _tabController,
                        tabs: [
                          _buildTab("Description", _selectedIndex == 0,
                              theamNotifier),
                          _buildTab(
                              "Company", _selectedIndex == 1, theamNotifier),
                        ]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _description(theamNotifier),
                  _company(theamNotifier),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _description(TheamModal theamNotifier) {
    return SizedBox(
        child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          "Qualifications:",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theamNotifier.isDark ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 20),
        QualificationListItem(
            "Exceptional communication skills and team working skill",
            theamNotifier: theamNotifier),
        const SizedBox(
          height: 14,
        ),
        QualificationListItem("Creative with an eye for shape and colour",
            theamNotifier: theamNotifier),
        const SizedBox(
          height: 14,
        ),
        QualificationListItem(
            "Know the principal of animation and you can create high prototypes",
            theamNotifier: theamNotifier),
        const SizedBox(
          height: 14,
        ),
        QualificationListItem("Figma, Xd & Sketch must know about this apps",
            theamNotifier: theamNotifier),
        const SizedBox(
          height: 14,
        ),
      ],
    ));
  }

  Widget _company(TheamModal theamNotifer) {
    return SizedBox(
        child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          "About Company:",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theamNotifer.isDark ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 20),
        QualificationListItem(
          "Exceptional communication skills and team working skill",
          theamNotifier: theamNotifer,
        ),
        const SizedBox(
          height: 14,
        ),
        QualificationListItem(
          "Creative with an eye for shape and colour",
          theamNotifier: theamNotifer,
        ),
        const SizedBox(
          height: 14,
        ),
        QualificationListItem(
          "Know the principal of animation and you can create high prototypes",
          theamNotifier: theamNotifer,
        ),
        const SizedBox(
          height: 14,
        ),
        QualificationListItem(
          "Figma, Xd & Sketch must know about this apps",
          theamNotifier: theamNotifer,
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    ));
  }

  Widget _buildTab(String text, bool isSelected, TheamModal theamNotifier) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? Colors.white
                : theamNotifier.isDark
                    ? Colors.black.withOpacity(0.5)
                    : Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class QualificationListItem extends StatelessWidget {
  final String text;
  final TheamModal theamNotifier;

  const QualificationListItem(this.text,
      {super.key, required this.theamNotifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(
              fontSize: 21,
              color: theamNotifier.isDark ? Colors.white : Colors.black),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17,
                color: theamNotifier.isDark ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class JobDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green.shade50,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header Section
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.green.shade400,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.work, size: 40, color: Colors.green),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Product Designer",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     "Google",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white70,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TagChip(label: "Design"),
//                       SizedBox(width: 10),
//                       TagChip(label: "Full-Time"),
//                       SizedBox(width: 10),
//                       TagChip(label: "Junior"),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, color: Colors.white),
//                           SizedBox(width: 5),
//                           Text(
//                             "California, USA",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "\$160,000/year",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // Tab Bar
//             Container(
//               margin: EdgeInsets.only(top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TabItem(label: "Description", isActive: false),
//                   TabItem(label: "Requirement", isActive: true),
//                   TabItem(label: "About", isActive: false),
//                   TabItem(label: "Reviews", isActive: false),
//                 ],
//               ),
//             ),

//             // Content Section
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Requirements",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     RequirementBullet(
//                         text:
//                             "Master's degree in Design, Computer Science, or a related field."),
//                     RequirementBullet(
//                         text: "3 years of relevant industry experience."),
//                     RequirementBullet(
//                         text:
//                             "Ability to lead and ideate products from scratch and improve features."),
//                     RequirementBullet(
//                         text:
//                             "Skills in communicating and influencing product design strategy."),
//                     RequirementBullet(
//                         text:
//                             "Excellent problem-solving skills and familiarity with technical constraints."),
//                     RequirementBullet(
//                         text:
//                             "Experience designing across multiple platforms."),
//                     RequirementBullet(
//                         text:
//                             "Portfolio highlighting multiple projects and your direct contributions."),
//                   ],
//                 ),
//               ),
//             ),

//             // Footer Section
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                   backgroundColor: Colors.green,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Apply Now",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TagChip extends StatelessWidget {
//   final String label;

//   const TagChip({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: Colors.green,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class TabItem extends StatelessWidget {
//   final String label;
//   final bool isActive;

//   const TabItem({required this.label, required this.isActive});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: TextStyle(
//         color: isActive ? Colors.green : Colors.grey,
//         fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//       ),
//     );
//   }
// }

// class RequirementBullet extends StatelessWidget {
//   final String text;

//   const RequirementBullet({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "• ",
//           style: TextStyle(fontSize: 16, height: 1.5),
//         ),
//         Expanded(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: JobDetailsPage(),
//     );
//   }
// }

// class JobDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> jobData = {
//     "title": "Product Designer",
//     "company": "Google",
//     "location": "California, USA",
//     "salary": "\$160,000/year",
//     "tags": ["Design", "Full-Time", "Junior"],
//     "requirements": [
//       "Master's degree in Design, Computer Science, or a related field.",
//       "3 years of relevant industry experience.",
//       "Ability to lead and ideate products from scratch and improve features.",
//       "Skills in communicating and influencing product design strategy.",
//       "Excellent problem-solving skills and familiarity with technical constraints.",
//       "Experience designing across multiple platforms.",
//       "Portfolio highlighting multiple projects and your direct contributions."
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4, // Four tabs
//       child: Scaffold(
//         backgroundColor: Colors.green.shade50,
//         appBar: AppBar(
//           elevation: 0,
//           toolbarHeight: 29,
//           backgroundColor: Colors.green.shade400,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade400,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.white,
//                       child: Icon(Icons.work, size: 40, color: Colors.green),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       jobData["title"],
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       jobData["company"],
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: jobData["tags"]
//                           .map<Widget>((tag) => Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 5),
//                                 child: TagChip(label: tag),
//                               ))
//                           .toList(),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(Icons.location_on, color: Colors.white),
//                             SizedBox(width: 5),
//                             Text(
//                               jobData["location"],
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           jobData["salary"],
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               TabBar(
//                 labelColor: Colors.green,
//                 unselectedLabelColor: Colors.grey,
//                 indicatorColor: Colors.green,
//                 tabs: [
//                   Tab(text: "Description"),
//                   Tab(text: "Requirement"),
//                   Tab(text: "About"),
//                   Tab(text: "Reviews"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Description Tab
//             Center(child: Text("Description Content")),

//             // Requirement Tab
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 children: jobData["requirements"]
//                     .map<Widget>(
//                         (requirement) => RequirementBullet(text: requirement))
//                     .toList(),
//               ),
//             ),

//             // About Tab
//             Center(child: Text("About Content")),

//             // Reviews Tab
//             Center(child: Text("Reviews Content")),
//           ],
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(20),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(double.infinity, 50),
//               backgroundColor: Colors.green,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             onPressed: () {
//               // Apply Now Button Logic
//             },
//             child: Text(
//               "Apply Now",
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TagChip extends StatelessWidget {
//   final String label;

//   const TagChip({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: Colors.green,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class RequirementBullet extends StatelessWidget {
//   final String text;

//   const RequirementBullet({required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "• ",
//           style: TextStyle(fontSize: 16, height: 1.5),
//         ),
//         Expanded(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//         ),
//       ],
//     );
//   }
// }
