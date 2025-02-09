import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/job_detail/screen/jobscreen.dart';
import 'package:jobgo/features/screen/search/screen/search_screen.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> jobs = [
    {
      'logoPath': 'asset/images/google_logo.png',
      'companyName': 'Google',
      'jobTitle': 'Lead Product Manager',
      'salary': '\$2500/m',
      'location': 'Toronto, Canada',
      'isFavorite': true,
    },
    {
      'logoPath': 'asset/images/fb_logo.png',
      'companyName': 'Meta',
      'jobTitle': 'Product Designer',
      'salary': '\$3000/m',
      'location': 'California, USA',
      'isFavorite': false,
    },
    {
      'logoPath': 'asset/images/dribbble_logo.png',
      'companyName': 'Dribbble',
      'jobTitle': 'Lead Product Manager',
      'salary': '\$2500/m',
      'location': 'Toronto, Canada',
      'isFavorite': true,
    },
    {
      'logoPath': 'asset/images/google_logo.png',
      'companyName': 'Meta',
      'jobTitle': 'Product Designer',
      'salary': '\$3000/m',
      'location': 'California, USA',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          // flexibleSpace: PreferredSize(
          //   preferredSize: Size.fromHeight(120.0),
          //   child: Container(
          //       decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Colors.blue, Colors.purple],
          //   ))),
          // ),
          elevation: 0,
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          toolbarHeight: 120,
          title: Padding(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: "Discover your dream job"
                        .text
                        .bold
                        .maxLines(2)
                        .size(30)
                        .make()),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        theamNotifier.isDark = !theamNotifier.isDark;
                      });
                    },
                    child: theamNotifier.isDark
                        ? const Icon(
                            Icons.light_mode,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.dark_mode,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
                },
                child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: theamNotifier.isDark
                          ? mainDarkColor
                          : Colors.grey.withOpacity(0.15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    height: 55,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          CupertinoIcons.search,
                          color: theamNotifier.isDark
                              ? lightColor
                              : Colors.black.withOpacity(0.5),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        "   Search here..."
                            .text
                            .color(theamNotifier.isDark
                                ? lightColor
                                : Colors.black.withOpacity(0.5))
                            .size(15.7)
                            .fontWeight(FontWeight.w500)
                            .make()
                            .py12()
                        // .pOnly(top: 5),
                      ],
                    )),
              ).px(20),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Popular Jobs"
                      .text
                      .xl2
                      .bold
                      .color(theamNotifier.isDark ? Colors.white : Colors.black)
                      .make(),
                  "Show All".text.bold.color(Colors.grey.shade500).make(),
                ],
              ).px(20),
              const SizedBox(height: 7),
              SizedBox(
                height: 200, // Adjust to match card height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(
                              right: 20.0, bottom: 10, top: 10, left: 5)
                          : const EdgeInsets.only(
                              right: 20.0, bottom: 10, top: 10),
                      child: _buildJobCard(
                        logoPath: job['logoPath'],
                        companyName: job['companyName'],
                        jobTitle: job['jobTitle'],
                        salary: job['salary'],
                        location: job['location'],
                        isFavorite: job['isFavorite'],
                        theamNotifier: theamNotifier,
                      ),
                    );
                  },
                ),
              ).pOnly(left: 20),
              const SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Recent Jobs"
                      .text
                      .xl2
                      .bold
                      .color(theamNotifier.isDark ? Colors.white : Colors.black)
                      .make(),
                  "Show All".text.bold.color(Colors.grey.shade500).make(),
                ],
              ).px(20),
              ListView.builder(
                  itemCount: jobs.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const JobDetailsPage()));
                      },
                      child: Container(
                        margin: index == 0
                            ? const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 18)
                            : const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 15),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: theamNotifier.isDark
                              ? mainDarkColor
                              : lightColorBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: AssetImage(jobs[index]
                                                  ['logoPath']
                                              .toString()),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: index == 0 || index == 2
                                          ? "UI/UX Designer"
                                              .text
                                              .color(theamNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black)
                                              .maxLines(2)
                                              .bold
                                              .size(16.5)
                                              .make()
                                          : jobs[index]['jobTitle']
                                              .toString()
                                              .text
                                              .color(theamNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black)
                                              .maxLines(2)
                                              .bold
                                              .size(16.5)
                                              .make(),
                                    ),
                                    const SizedBox(height: 5),
                                    "Full Time"
                                        .text
                                        .color(lightTextColor)
                                        .size(14)
                                        .make(),
                                  ],
                                )
                              ],
                            ),
                            const Text(
                              "\$4500/m",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: mainColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      );
    });
  }

  Widget _buildJobCard({
    required String logoPath,
    required String companyName,
    required String jobTitle,
    required String salary,
    required String location,
    required bool isFavorite,
    required TheamModal theamNotifier,
  }) {
    return Container(
      width: 290,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: theamNotifier.isDark ? mainDarkColor : Colors.white,
        color: const Color(0xFF35Cb67),
        image: const DecorationImage(
            image: AssetImage("asset/images/1.png"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 54,
                height: 54,
                padding: logoPath == "asset/images/google_logo.png"
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: logoPath == "asset/images/google_logo.png"
                      ? Colors.white.withOpacity(0.9)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  // image: DecorationImage(
                  //     image: AssetImage(logoPath), fit: BoxFit.cover)
                ),
                child: Image.asset(
                  logoPath,
                  fit: BoxFit.cover,
                ),
              ),
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            ],
          ),
          Text(
            companyName,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            jobTitle,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            children: [
              Text(
                salary,
                style: TextStyle(
                  fontSize: 14,
                  color: theamNotifier.isDark ? Colors.white : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 241, 242, 242),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
