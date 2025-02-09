import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class JobApplicationsScreen extends StatelessWidget {
  const JobApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          title: Text(
            'Applications',
            style: TextStyle(
                color: theamNotifier.isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your Applications',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: theamNotifier.isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  JobApplicationCard(
                    companyLogo: "asset/images/dribbble_logo.png",
                    companyName: 'Facebook',
                    jobTitle: 'UI/UX Designer',
                    location: 'Toronto, Canada',
                    status: 'Delivered',
                    salary: '\$4500 Monthly',
                    statusColor: Colors.pink.withOpacity(0.8),
                  ),
                  const JobApplicationCard(
                    companyLogo: "asset/images/fb_logo.png",
                    companyName: 'Facebook',
                    jobTitle: 'Product Designer',
                    location: 'Karachi, Pakistan',
                    status: 'Delivered',
                    salary: '\$4500 Monthly',
                    statusColor: Colors.blue,
                  ),
                  JobApplicationCard(
                    companyLogo: "asset/images/dribbble_logo.png",
                    companyName: 'Facebook',
                    jobTitle: 'UI/UX Designer',
                    location: 'Toronto, Canada',
                    status: 'Delivered',
                    salary: '\$4500 Monthly',
                    statusColor: Colors.pink.withOpacity(0.8),
                  ),
                  JobApplicationCard(
                    companyLogo: "asset/images/dribbble_logo.png",
                    companyName: 'Facebook',
                    jobTitle: 'UI/UX Designer',
                    location: 'Toronto, Canada',
                    status: 'Delivered',
                    salary: '\$4500 Monthly',
                    statusColor: Colors.pink.withOpacity(0.8),
                  ),
                  const JobApplicationCard(
                    companyLogo: "asset/images/fb_logo.png",
                    companyName: 'Facebook',
                    jobTitle: 'Product Designer',
                    location: 'Karachi, Pakistan',
                    status: 'Delivered',
                    salary: '\$4500 Monthly',
                    statusColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ).px16(),
      );
    });
  }
}

class JobApplicationCard extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String jobTitle;
  final String location;
  final String status;
  final String salary;
  final Color statusColor;

  const JobApplicationCard({
    super.key,
    required this.companyLogo,
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.status,
    required this.salary,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: theamNotifier.isDark ? mainDarkColor : lightColorBackground,
          borderRadius: BorderRadius.circular(19),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     blurRadius: 8,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage(companyLogo), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dribbble",
                      style: TextStyle(fontSize: 15, color: lightTextColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    "UI/UX Designer"
                        .text
                        .color(
                            theamNotifier.isDark ? Colors.white : Colors.black)
                        .maxLines(2)
                        .bold
                        .size(18.5)
                        .make(),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Toronto, Canada",
                      style: TextStyle(fontSize: 15, color: lightTextColor),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert_sharp,
                  color: lightTextColor,
                ).pOnly(bottom: 35),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: 5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: "Delivered"
                      .text
                      .bold
                      .color(Colors.white)
                      .size(15)
                      .make()
                      .centered(),
                ),
                Text(
                  "\$4500/m",
                  style: TextStyle(
                      fontSize: 19,
                      color: statusColor,
                      fontWeight: FontWeight.bold),
                ).pOnly(right: 10),
              ],
            )
          ],
        ),
      );
    });
  }
}
