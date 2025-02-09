import 'package:country_picker/country_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class JobApplyPage extends StatefulWidget {
  const JobApplyPage({super.key});

  @override
  State<JobApplyPage> createState() => _JobApplyPageState();
}

class _JobApplyPageState extends State<JobApplyPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Consumer<TheamModal>(builder: (context, theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          title: Text(
            "Job Apply",
            style: TextStyle(
                color: theamNotifier.isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFileUpload(theamNotifier),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: theamNotifier.isDark
                                    ? Colors.white
                                    : Colors.black)),
                        const SizedBox(height: 12),
                        buildTextField(firstNameController, "e.g Faizan", false,
                            theamNotifier),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Name",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: theamNotifier.isDark
                                    ? Colors.white
                                    : Colors.black)),
                        const SizedBox(height: 12),
                        buildTextField(firstNameController, "e.g Ahmed", false,
                            theamNotifier),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Your Email",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color:
                          theamNotifier.isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 20),
              buildTextField(lastNameController, " e.g hello@gmail.com", true,
                  theamNotifier),
              const SizedBox(height: 20),
              buildCountryPicker(theamNotifier),
              const SizedBox(height: 26),
              buildMessageField(theamNotifier),
              const SizedBox(height: 26),
              buildApplyButton(),
              const SizedBox(height: 26),
            ],
          ).px20(),
        ),
      );
    });
  }

  Widget buildTextField(TextEditingController controller, String hint,
      bool isEmail, TheamModal theamNotifier) {
    return Container(
      padding:
          isEmail ? const EdgeInsets.only(left: 10) : const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: theamNotifier.isDark ? mainDarkColor : lightColorBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: TextStyle(
            color: theamNotifier.isDark
                ? Colors.white.withOpacity(0.8)
                : Colors.black.withOpacity(0.8)),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: isEmail
              ? const Icon(Icons.email, color: mainColor)
              : const Icon(FluentSystemIcons.ic_fluent_person_filled,
                  color: mainColor),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget buildCountryPicker(TheamModal theamNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Country",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: theamNotifier.isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              onSelect: (Country country) {
                setState(() {
                  selectedCountry = country.name;
                });
              },
            );
          },
          child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color:
                    theamNotifier.isDark ? mainDarkColor : lightColorBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    FluentSystemIcons.ic_fluent_flag_filled,
                    color: mainColor,
                  ),
                  const SizedBox(width: 12),
                  Text(selectedCountry ?? "Select Country",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theamNotifier.isDark
                              ? const Color.fromARGB(255, 166, 166, 166)
                              : Colors.black)),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: mainColor,
                  ),
                  const SizedBox(width: 12),
                ],
              )),
        ),
      ],
    );
  }

  Widget buildMessageField(TheamModal theamNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Message",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: theamNotifier.isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: theamNotifier.isDark ? mainDarkColor : lightColorBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            maxLines: 5,
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

  Widget buildFileUpload(TheamModal theamNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("CV",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: theamNotifier.isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {},
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey,
            radius: const Radius.circular(10),
            dashPattern: const [10, 4],
            strokeCap: StrokeCap.round,
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: theamNotifier.isDark
                    ? Colors.transparent
                    : lightColorBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FluentSystemIcons.ic_fluent_folder_filled,
                    size: 30,
                    color: mainColor,
                  ),
                  "Upload here".text.color(lightTextColor).make(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildApplyButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const JobApplyPage()));
      },
      child: Container(
        height: 55,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: mainColor,
        ),
        child: const Center(
          child: Text(
            "Apply Now",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
