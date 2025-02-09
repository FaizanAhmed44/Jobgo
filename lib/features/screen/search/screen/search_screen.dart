import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> jobs = [
    {
      'logoPath': 'asset/images/dribbble_logo.png',
      'companyName': 'Dribbble',
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
      'logoPath': 'asset/images/fb_logo.png',
      'companyName': 'Meta',
      'jobTitle': 'Product Designer',
      'salary': '\$3000/m',
      'location': 'California, USA',
      'isFavorite': false,
    },
  ];
  bool isShow = false;
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedLocation;
  String? selectedSalary;
  List<String> jobTypes = [
    "Full Time",
    "Part Time",
    "Contract",
    "Freelance",
    "Remote"
  ];
  List<String> selectedJobTypes = [];

  final Map<String, List<String>> categories = {
    "UI/UX Design": ["Graphics Design", "Interaction Design", "Visual Design"],
    "Development": ["Frontend", "Backend", "Full Stack"],
    "Marketing": ["SEO", "Content Marketing", "Social Media"]
  };
  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          title: const Text(
            'Search',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                  color: theamNotifier.isDark
                      ? mainDarkColor
                      : Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '  Search here...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor:
                        theamNotifier.isDark ? darkColor : Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => StatefulBuilder(
                      builder: (context, setModalState) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 4,
                                    width: 75,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: Container()),
                                  Text(
                                    "Set Filters",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: theamNotifier.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ).pOnly(left: 50),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                    onTap: () {
                                      setModalState(() {
                                        selectedCategory = null;
                                        selectedSubCategory = null;
                                        selectedLocation = null;
                                        selectedSalary = null;
                                        selectedJobTypes.clear();
                                      });
                                    },
                                    child: const Text(
                                      "RESET",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15, color: lightColor),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              "Category"
                                  .text
                                  .bold
                                  .size(19)
                                  .color(theamNotifier.isDark
                                      ? Colors.white
                                      : Colors.black)
                                  .make(),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: theamNotifier.isDark
                                      ? mainDarkColor
                                      : lightColorBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedCategory,
                                  dropdownColor: theamNotifier.isDark
                                      ? mainDarkColor
                                      : Colors.white,
                                  underline: Container(),
                                  isExpanded: true,
                                  hint: const Text(
                                    "Select Category",
                                  ),
                                  items: categories.keys
                                      .map((category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(category,
                                                style: TextStyle(
                                                    color: theamNotifier.isDark
                                                        ? Colors.white
                                                        : Colors.black)),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setModalState(() {
                                      selectedCategory = value;
                                      selectedSubCategory =
                                          null; // Reset subcategory
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 16.0),

                              // Subcategory Dropdown
                              "Sub Category"
                                  .text
                                  .bold
                                  .size(19)
                                  .color(theamNotifier.isDark
                                      ? Colors.white
                                      : Colors.black)
                                  .make(),
                              const SizedBox(
                                height: 10,
                              ),

                              Container(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: theamNotifier.isDark
                                      ? mainDarkColor
                                      : lightColorBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedSubCategory,
                                  dropdownColor: theamNotifier.isDark
                                      ? mainDarkColor
                                      : Colors.white,
                                  underline: Container(),
                                  isExpanded: true,
                                  hint: const Text("Select Sub Category"),
                                  items: selectedCategory != null
                                      ? categories[selectedCategory]!
                                          .map((subCategory) =>
                                              DropdownMenuItem(
                                                value: subCategory,
                                                child: Text(subCategory,
                                                    style: TextStyle(
                                                        color: theamNotifier
                                                                .isDark
                                                            ? Colors.white
                                                            : Colors.black)),
                                              ))
                                          .toList()
                                      : [],
                                  onChanged: (value) {
                                    setModalState(() {
                                      selectedSubCategory = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "Location"
                                          .text
                                          .bold
                                          .size(17.5)
                                          .color(theamNotifier.isDark
                                              ? Colors.white
                                              : Colors.black)
                                          .make(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                          color: theamNotifier.isDark
                                              ? mainDarkColor
                                              : lightColorBackground,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FluentSystemIcons
                                                  .ic_fluent_location_filled,
                                              color: mainColor,
                                            ),
                                            const SizedBox(width: 10),
                                            DropdownButton<String>(
                                              value: selectedLocation,
                                              dropdownColor:
                                                  theamNotifier.isDark
                                                      ? mainDarkColor
                                                      : Colors.white,
                                              underline: Container(),
                                              hint: const Text("Select"),
                                              items: ["Canada", "USA", "UK"]
                                                  .map((location) =>
                                                      DropdownMenuItem(
                                                        value: location,
                                                        child: Text(location,
                                                            style: TextStyle(
                                                                color: theamNotifier
                                                                        .isDark
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black)),
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {
                                                setModalState(() {
                                                  selectedLocation = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "Salary"
                                          .text
                                          .bold
                                          .size(17.5)
                                          .color(theamNotifier.isDark
                                              ? Colors.white
                                              : Colors.black)
                                          .make(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                          color: theamNotifier.isDark
                                              ? mainDarkColor
                                              : lightColorBackground,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.payment,
                                              color: mainColor,
                                            ),
                                            const SizedBox(width: 10),
                                            DropdownButton<String>(
                                              underline: Container(),
                                              value: selectedSalary,
                                              dropdownColor:
                                                  theamNotifier.isDark
                                                      ? mainDarkColor
                                                      : Colors.white,
                                              hint: const Text("Select"),
                                              items:
                                                  [
                                                "\$2k-\$5k",
                                                "\$5k-\$10k",
                                                "\$10k+"
                                              ]
                                                      .map(
                                                          (salary) =>
                                                              DropdownMenuItem(
                                                                value: salary,
                                                                child: Text(
                                                                    salary,
                                                                    style: TextStyle(
                                                                        color: theamNotifier.isDark
                                                                            ? Colors.white
                                                                            : Colors.black)),
                                                              ))
                                                      .toList(),
                                              onChanged: (value) {
                                                setModalState(() {
                                                  selectedSalary = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              // Location Dropdown

                              const SizedBox(height: 16.0),

                              // Job Type Selection
                              "Job Type"
                                  .text
                                  .bold
                                  .size(19)
                                  .color(theamNotifier.isDark
                                      ? Colors.white
                                      : Colors.black)
                                  .make(),
                              const SizedBox(height: 16.0),
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  ...jobTypes.map((jobType) {
                                    final isSelected =
                                        selectedJobTypes.contains(jobType);
                                    return ChoiceChip(
                                      side: BorderSide.none,
                                      showCheckmark: false,
                                      label: Text(
                                        jobType,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : theamNotifier.isDark
                                                  ? Colors.grey
                                                  : Colors.black,
                                        ),
                                      ),
                                      selected: isSelected,
                                      selectedColor: mainColor,
                                      backgroundColor: theamNotifier.isDark
                                          ? mainDarkColor
                                          : lightColorBackground,
                                      onSelected: (selected) {
                                        setModalState(() {
                                          if (selected) {
                                            selectedJobTypes.add(jobType);
                                          } else {
                                            selectedJobTypes.remove(jobType);
                                          }
                                        });
                                      },
                                    );
                                  }),

                                  // "Show All Type" Chip
                                  ChoiceChip(
                                    label: Text(
                                      "Show All Type",
                                      style: TextStyle(
                                        color: selectedJobTypes.length ==
                                                jobTypes.length
                                            ? Colors.white
                                            : theamNotifier.isDark
                                                ? Colors.grey
                                                : Colors.black,
                                      ),
                                    ),
                                    selected: selectedJobTypes.length ==
                                        jobTypes.length,
                                    side: BorderSide.none,
                                    selectedColor: mainColor,
                                    showCheckmark: false,
                                    backgroundColor: theamNotifier.isDark
                                        ? mainDarkColor
                                        : lightColorBackground,
                                    onSelected: (selected) {
                                      setModalState(() {
                                        if (selected) {
                                          // Select All Job Types
                                          selectedJobTypes.clear();
                                          selectedJobTypes.addAll(jobTypes);
                                        } else {
                                          // Deselect All Job Types
                                          selectedJobTypes.clear();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, {
                                    'category': selectedCategory,
                                    'subCategory': selectedSubCategory,
                                    'location': selectedLocation,
                                    'salary': selectedSalary,
                                    'jobTypes': selectedJobTypes,
                                  });
                                },
                                child: Container(
                                  height: 58,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ).px16();
                      },
                    ),
                  ).then((filters) {
                    if (filters != null) {
                      setState(() {
                        selectedCategory = filters['category'];
                        selectedSubCategory = filters['subCategory'];
                        selectedLocation = filters['location'];
                        selectedSalary = filters['salary'];
                        selectedJobTypes = filters['jobTypes'];
                      });
                    }
                  });

                  // showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius:
                  //         BorderRadius.vertical(top: Radius.circular(20)),
                  //   ),
                  //   builder: (context) => StatefulBuilder(
                  //     builder: (context, setModalState) {
                  //       return Padding(
                  //         padding: EdgeInsets.only(
                  //           bottom: MediaQuery.of(context).viewInsets.bottom,
                  //         ),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Container(
                  //               height: 4,
                  //               width: 75,
                  //               margin:
                  //                   const EdgeInsets.symmetric(vertical: 10),
                  //               decoration: BoxDecoration(
                  //                 color: Colors.grey.shade300,
                  //                 borderRadius: BorderRadius.circular(2),
                  //               ),
                  //             ),
                  //             const SizedBox(height: 10),
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Expanded(child: Container()),
                  //                 Text(
                  //                   "Set Filters",
                  //                   textAlign: TextAlign.center,
                  //                   style: TextStyle(
                  //                     color: theamNotifier.isDark
                  //                         ? Colors.white
                  //                         : Colors.black,
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 25,
                  //                   ),
                  //                 ).pOnly(left: 50),
                  //                 Expanded(child: Container()),
                  //                 GestureDetector(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       isShow = false;
                  //                     });
                  //                   },
                  //                   child: const Text(
                  //                     "RESET",
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                         fontSize: 15, color: lightColor),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             const SizedBox(height: 20),

                  //             const Text("Category"),
                  //             DropdownButton<String>(
                  //               value: selectedCategory,
                  //               isExpanded: true,
                  //               hint: const Text("Select Category"),
                  //               items: categories.keys
                  //                   .map((category) => DropdownMenuItem(
                  //                         value: category,
                  //                         child: Text(category),
                  //                       ))
                  //                   .toList(),
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   selectedCategory = value;
                  //                   selectedSubCategory =
                  //                       null; // Reset subcategory
                  //                 });
                  //               },
                  //             ),
                  //             const SizedBox(height: 16.0),

                  //             // Subcategory Dropdown
                  //             const Text("Sub Category"),
                  //             DropdownButton<String>(
                  //               value: selectedSubCategory,
                  //               isExpanded: true,
                  //               hint: const Text("Select Sub Category"),
                  //               items: selectedCategory != null
                  //                   ? categories[selectedCategory]!
                  //                       .map((subCategory) => DropdownMenuItem(
                  //                             value: subCategory,
                  //                             child: Text(subCategory),
                  //                           ))
                  //                       .toList()
                  //                   : [],
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   selectedSubCategory = value;
                  //                 });
                  //               },
                  //             ),
                  //             const SizedBox(height: 16.0),

                  //             // Location Dropdown
                  //             const Text("Location"),
                  //             DropdownButton<String>(
                  //               value: selectedLocation,
                  //               isExpanded: true,
                  //               hint: const Text("Select Location"),
                  //               items: ["Canada", "USA", "UK"]
                  //                   .map((location) => DropdownMenuItem(
                  //                         value: location,
                  //                         child: Text(location),
                  //                       ))
                  //                   .toList(),
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   selectedLocation = value;
                  //                 });
                  //               },
                  //             ),
                  //             const SizedBox(height: 16.0),

                  //             // Salary Dropdown
                  //             const Text("Salary"),
                  //             DropdownButton<String>(
                  //               value: selectedSalary,
                  //               isExpanded: true,
                  //               hint: const Text("Select Salary"),
                  //               items: ["\$2k-\$5k", "\$5k-\$10k", "\$10k+"]
                  //                   .map((salary) => DropdownMenuItem(
                  //                         value: salary,
                  //                         child: Text(salary),
                  //                       ))
                  //                   .toList(),
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   selectedSalary = value;
                  //                 });
                  //               },
                  //             ),
                  //             const SizedBox(height: 16.0),

                  //             // Job Type Selection
                  //             const Text("Job Type"),
                  //             Wrap(
                  //               spacing: 8.0,
                  //               children: jobTypes.map((jobType) {
                  //                 final isSelected =
                  //                     selectedJobTypes.contains(jobType);
                  //                 return ChoiceChip(
                  //                   label: Text(jobType),
                  //                   selected: isSelected,
                  //                   onSelected: (selected) {
                  //                     setState(() {
                  //                       isSelected
                  //                           ? selectedJobTypes.remove(jobType)
                  //                           : selectedJobTypes.add(jobType);
                  //                     });
                  //                   },
                  //                 );
                  //               }).toList(),
                  //             ),
                  //             // const Spacer(),

                  //             const SizedBox(height: 10),
                  //             GestureDetector(
                  //               onTap: () {
                  //                 // Navigator.pop(context, {
                  //                 //   'gender': selectedGender,
                  //                 //   'minPrice': minPrice,
                  //                 //   'maxPrice': maxPrice,
                  //                 // });
                  //               },
                  //               child: Container(
                  //                 height: 58,
                  //                 width: double.maxFinite,
                  //                 decoration: BoxDecoration(
                  //                   color: const Color(0xFF5B9EE1),
                  //                   borderRadius: BorderRadius.circular(50),
                  //                 ),
                  //                 child: "Apply"
                  //                     .text
                  //                     .color(Colors.white)
                  //                     .size(18)
                  //                     .bold
                  //                     .make()
                  //                     .centered(),
                  //               ),
                  //             ),
                  //             const SizedBox(height: 20),
                  //           ],
                  //         ),
                  //       ).px16();
                  //     },
                  //   ),
                  // ).then((filters) {
                  // });
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Icon(FluentSystemIcons.ic_fluent_filter_filled,
                      size: 26, color: Colors.white),
                ),
              ),
            ]).px20(),
            const SizedBox(height: 25),
            Text(
              '35 Job Opportunity',
              style: TextStyle(
                  fontSize: 18,
                  color: theamNotifier.isDark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ).px20(),
            const SizedBox(height: 25),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: "Most Relevant"
                      .text
                      .bold
                      .size(15)
                      .color(Colors.white)
                      .makeCentered(),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: theamNotifier.isDark
                        ? mainDarkColor
                        : lightColorBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: "Most Recent"
                      .text
                      .bold
                      .size(15)
                      .color(
                          theamNotifier.isDark ? Colors.white70 : Colors.black)
                      .makeCentered(),
                )
              ],
            ).px(20),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
                    itemCount: jobs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 15),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: theamNotifier.isDark
                              ? mainDarkColor
                              : lightColorBackground,
                          borderRadius: BorderRadius.circular(19),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.2),
                          //     blurRadius: 8,
                          //     offset: const Offset(0, 4),
                          //   ),
                          // ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(jobs[index]['logoPath']),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 18),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.63,
                                  // color: sColors.red,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      jobs[index]['companyName']
                                          .toString()
                                          .text
                                          .color(Colors.grey.shade500)
                                          .size(14)
                                          .make(),
                                      const Icon(Icons.favorite,
                                          color: mainColor),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  // color: Colors.red,
                                  width:
                                      MediaQuery.of(context).size.width * 0.57,
                                  child: index == 0 || index == 2
                                      ? "UI/UX Designer"
                                          .text
                                          .maxLines(2)
                                          .color(theamNotifier.isDark
                                              ? Colors.white
                                              : Colors.black)
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
                                const SizedBox(height: 7),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.63,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          "\$4500/m"
                                              .text
                                              .color(theamNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black)
                                              .size(13)
                                              .make(),
                                          const SizedBox(width: 10),
                                          jobs[index]['location']
                                              .toString()
                                              .text
                                              .color(Colors.grey.shade500)
                                              .size(13)
                                              .make(),
                                        ],
                                      ),
                                      Text(
                                        "06h",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      );
    });
  }
}
