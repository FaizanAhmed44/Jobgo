import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/bottom_navigation_bar/bottom_nav_bar_screen.dart';
import 'package:jobgo/features/screen/model/supporting_model.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfessionalDetailsScreen extends StatefulWidget {
  final String uid;

  const ProfessionalDetailsScreen({super.key, required this.uid});

  @override
  State<ProfessionalDetailsScreen> createState() =>
      _ProfessionalDetailsScreenState();
}

class _ProfessionalDetailsScreenState extends State<ProfessionalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _resumeUrlController = TextEditingController();
  final TextEditingController _portfolioUrlController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  List<Education> _educationList = [];
  List<Experience> _experienceList = [];

  bool _isLoading = false;

  Future<void> _saveDetails() async {
    //   print(_locationController);
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final userRef = FirebaseFirestore.instance
            .collection('job_seekers')
            .doc(widget.uid);

        await userRef.set({
          'bio': _bioController.text,
          'education': _educationList.map((e) => e.toMap()).toList(),
          'experience': _experienceList.map((e) => e.toMap()).toList(),
          'skills': _skillsController.text.split(','),
          'resumeUrl': _resumeUrlController.text,
          'portfolioUrl': _portfolioUrlController.text,
          'location': _locationController.text,
        }, SetOptions(merge: true));

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Professional details saved successfully!')),
        );

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save details: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _addEducation() {
    setState(() {
      _educationList.add(Education(degree: '', institute: '', year: ''));
    });
  }

  void _removeEducation(int index) {
    setState(() {
      _educationList.removeAt(index);
    });
  }

  void _addExperience() {
    setState(() {
      _experienceList.add(Experience(jobTitle: '', company: '', years: ''));
    });
  }

  void _removeExperience(int index) {
    setState(() {
      _experienceList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          title: const Text(
            'Professional Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const CustomBottomNavBarUser()),
                  (route) => false,
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildBioField(theamNotifier, _bioController),
                      const SizedBox(height: 20.0),
                      Text("Education",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: theamNotifier.isDark
                                      ? Colors.white
                                      : Colors.black))
                          .px(6),
                      const SizedBox(
                        height: 18,
                      ),
                      ..._educationList.asMap().entries.map((entry) {
                        int index = entry.key;
                        Education education = entry.value;
                        return Column(
                          key: ValueKey(education),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" => Degree",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: theamNotifier.isDark
                                            ? Colors.white
                                            : Colors.black))
                                .px(6),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? mainDarkColor
                                    : lightColorBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 154, 154, 154)),
                                decoration: const InputDecoration(
                                  hintText: "Type here...",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 154, 154, 154)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    education.degree = value;
                                  });
                                },
                              ),
                            ).px(0),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(" => Institute",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: theamNotifier.isDark
                                            ? Colors.white
                                            : Colors.black))
                                .px(6),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? mainDarkColor
                                    : lightColorBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 154, 154, 154)),
                                decoration: const InputDecoration(
                                  hintText: "Type here...",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 154, 154, 154)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    education.institute = value;
                                  });
                                },
                              ),
                            ).px(0),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(" => Year",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: theamNotifier.isDark
                                            ? Colors.white
                                            : Colors.black))
                                .px(6),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? mainDarkColor
                                    : lightColorBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 154, 154, 154)),
                                decoration: const InputDecoration(
                                  hintText: "Type here...",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 154, 154, 154)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    education.year = value;
                                  });
                                },
                              ),
                            ).px(0),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  _removeEducation(index);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      FluentSystemIcons.ic_fluent_delete_filled,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        );
                      }),
                      GestureDetector(
                        onTap: _addEducation,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: 'Add Education'
                              .text
                              .color(Colors.white)
                              .bold
                              .make(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text("Experience",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: theamNotifier.isDark
                                      ? Colors.white
                                      : Colors.black))
                          .px(6),
                      const SizedBox(
                        height: 19,
                      ),
                      ..._experienceList.asMap().entries.map((entry) {
                        int index = entry.key;
                        Experience experience = entry.value;
                        return Column(
                          key: ValueKey(experience),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" => Job Title",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: theamNotifier.isDark
                                            ? Colors.white
                                            : Colors.black))
                                .px(6),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? mainDarkColor
                                    : lightColorBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 154, 154, 154)),
                                decoration: const InputDecoration(
                                  hintText: "Type here...",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 154, 154, 154)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    experience.jobTitle = value;
                                  });
                                },
                              ),
                            ).px(0),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(" => Company",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: theamNotifier.isDark
                                            ? Colors.white
                                            : Colors.black))
                                .px(6),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? mainDarkColor
                                    : lightColorBackground,
                                borderRadius: BorderRadius.circular(12),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.1),
                                //     blurRadius: 10,
                                //     spreadRadius: 6,
                                //     offset: const Offset(0, 6),
                                //   ),
                                // ],
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 154, 154, 154)),
                                decoration: const InputDecoration(
                                  hintText: "Type here...",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 154, 154, 154)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    experience.company = value;
                                  });
                                },
                              ),
                            ).px(0),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(" => Years",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: theamNotifier.isDark
                                            ? Colors.white
                                            : Colors.black))
                                .px(6),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              decoration: BoxDecoration(
                                color: theamNotifier.isDark
                                    ? mainDarkColor
                                    : lightColorBackground,
                                borderRadius: BorderRadius.circular(12),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.1),
                                //     blurRadius: 10,
                                //     spreadRadius: 6,
                                //     offset: const Offset(0, 6),
                                //   ),
                                // ],
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 154, 154, 154)),
                                decoration: const InputDecoration(
                                  hintText: "Type here...",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 154, 154, 154)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    experience.years = value;
                                  });
                                },
                              ),
                            ).px(0),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  _removeExperience(index);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      FluentSystemIcons.ic_fluent_delete_filled,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        );
                      }),
                      // ..._experienceList.map((experience) {
                      //   int index = _experienceList.indexOf(experience);
                      //   return Column(
                      //     children: [
                      //       TextFormField(
                      //         decoration:
                      //             InputDecoration(labelText: 'Job Title'),
                      //         onChanged: (value) {
                      //           _experienceList[index].jobTitle = value;
                      //         },
                      //       ),
                      //       TextFormField(
                      //         decoration: InputDecoration(labelText: 'Company'),
                      //         onChanged: (value) {
                      //           _experienceList[index].company = value;
                      //         },
                      //       ),
                      //       TextFormField(
                      //         decoration: InputDecoration(labelText: 'Years'),
                      //         onChanged: (value) {
                      //           _experienceList[index].years = value;
                      //         },
                      //       ),
                      //       IconButton(
                      //         icon: Icon(Icons.delete),
                      //         onPressed: () => _removeExperience(index),
                      //       ),
                      //       SizedBox(height: 16.0),
                      //     ],
                      //   );
                      // }).toList(),
                      GestureDetector(
                        onTap: _addExperience,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: 'Add Experience'
                              .text
                              .color(Colors.white)
                              .bold
                              .make(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      customTextField(theamNotifier, _skillsController,
                          "Skills (comma separated)"),
                      const SizedBox(height: 20.0),
                      customTextField(
                          theamNotifier, _resumeUrlController, "Resume url"),
                      const SizedBox(height: 20.0),
                      customTextField(theamNotifier, _portfolioUrlController,
                          "Portfolio url"),
                      const SizedBox(height: 20),
                      customTextField(
                          theamNotifier, _locationController, "Location"),
                      const SizedBox(height: 30.0),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _saveDetails();
                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: "Save Details"
                                .text
                                .bold
                                .size(20)
                                .color(Colors.white)
                                .make()
                                .centered(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  Widget buildBioField(TheamModal theamNotifier, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bio",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: theamNotifier.isDark ? Colors.white : Colors.black))
            .px(6),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: theamNotifier.isDark ? mainDarkColor : lightColorBackground,
            borderRadius: BorderRadius.circular(12),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     blurRadius: 10,
            //     spreadRadius: 6,
            //     offset: const Offset(0, 6),
            //   ),
            // ],
          ),
          child: TextField(
            maxLines: 4,
            controller: controller,
            style: TextStyle(
                color: theamNotifier.isDark
                    ? Colors.white.withOpacity(0.8)
                    : Colors.black.withOpacity(0.8)),
            decoration: InputDecoration(
              hintText: '  Write your message...',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customTextField(TheamModal theamNotifier,
      TextEditingController controller, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText.text.bold
            .color(theamNotifier.isDark ? Colors.white : Colors.black)
            .size(20.5)
            .make()
            .px(6),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: theamNotifier.isDark ? mainDarkColor : lightColorBackground,
            borderRadius: BorderRadius.circular(12),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     blurRadius: 10,
            //     spreadRadius: 6,
            //     offset: const Offset(0, 6),
            //   ),
            // ],
          ),
          child: TextFormField(
            controller: controller,

            style: TextStyle(
                fontSize: 14,
                color: theamNotifier.isDark
                    ? Colors.white.withOpacity(0.8)
                    : Colors.black.withOpacity(0.8)),
            // controller: emailController,
            decoration: const InputDecoration(
              hintText: "type here...",
              hintStyle: TextStyle(
                fontSize: 14,
              ),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            onFieldSubmitted: (val) {
              setState(() {});
            },
          ),
        ).px(0),
      ],
    );
  }
}
