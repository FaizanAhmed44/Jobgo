import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:jobgo/const/colors.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Uint8List? image;
  bool isLoading = false;
  // DocumentSnapshot? user;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
  }

  @override
  void initState() {
    super.initState();
    // getUserDetail();
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(
      source: source,
    );

    if (file != null) {
      return await file.readAsBytes();
    }
  }

  // void getUserDetail() async {
  //   // userModel =
  //   DocumentSnapshot snap = await AuthMethods().getUserDetail();
  //   user = snap;
  //   setState(() {});
  // }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TheamModal theamNotifier, child) {
      return Scaffold(
        backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
        appBar: AppBar(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          title: "Edit profile"
              .text
              .size(19)
              .bold
              .color(theamNotifier.isDark ? Colors.white : Colors.black)
              .make(),
          centerTitle: false,
          actions: [
            image != null
                ? GestureDetector(
                    // onTap: () async {
                    //   setState(() {
                    //     isLoading = true;
                    //   });
                    //   await UserMethods().updateUserImage(
                    //       file: image!,
                    //       uid: FirebaseAuth.instance.currentUser!.uid);

                    //   image = null;
                    //   getUserDetail();
                    //   setState(() {
                    //     isLoading = false;
                    //   });
                    // },
                    child: const Icon(
                      Icons.done,
                      color: Colors.blue,
                      size: 30,
                    ).px16(),
                  )
                : Container(),
            (nameController.text.isNotEmpty ||
                    ageController.text.isNotEmpty ||
                    phoneController.text.isNotEmpty)
                ? GestureDetector(
                    onTap: () async {
                      // setState(() {
                      //   isLoading = true;
                      // });
                      // if (nameController.text.isEmpty) {
                      //   nameController.text =
                      //       (user!.data() as dynamic)['userName'];
                      // }
                      // if (ageController.text.isEmpty) {
                      //   ageController.text = (user!.data() as dynamic)['age'];
                      // }
                      // if (phoneController.text.isEmpty) {
                      //   phoneController.text =
                      //       (user!.data() as dynamic)['phoneNumber'];
                      // }
                      // await UserMethods().updateUserInfo(
                      //   age: ageController.text,
                      //   phone: phoneController.text,
                      //   name: nameController.text,
                      //   uid: FirebaseAuth.instance.currentUser!.uid,
                      // );
                      // getUserDetail();

                      // setState(() {
                      //   isLoading = false;
                      //   nameController.text = '';
                      //   ageController.text = '';
                      //   phoneController.text = '';
                      // });
                    },
                    child: const Icon(
                      Icons.done,
                      color: Colors.blue,
                      size: 30,
                    )).px16()
                : Container(),
          ],
        ),
        body:
            // user == null
            //     ? const Center(
            //         child: CircularProgressIndicator(
            //           color: Colors.blue,
            //         ),
            //       )
            // :

            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading ? const LinearProgressIndicator() : Container(),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 115,
                height: 125,
                child: Stack(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: image == null
                                ? const AssetImage("asset/images/person.jpg")
                                : MemoryImage(image!)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 40,
                      child: GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: mainColor,
                          child: const Icon(
                            size: 19,
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ).centered(),
                        ),
                      ),
                    ),
                  ],
                ),
              ).centered(),

              const SizedBox(
                height: 27,
              ),
              "Full Name"
                  .text
                  .bold
                  .color(theamNotifier.isDark ? Colors.white : Colors.black)
                  .size(16)
                  .make()
                  .px(25),
              const SizedBox(
                height: 15,
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theamNotifier.isDark
                      ? mainDarkColor
                      : lightColorBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: nameController,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 154, 154, 154)),
                  // controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Faizan Ahmed",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 154, 154, 154)),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (val) {
                    setState(() {});
                  },
                ),
              ).px(20),
              const SizedBox(
                height: 20,
              ),
              "Email Address"
                  .text
                  .bold
                  .color(theamNotifier.isDark ? Colors.white : Colors.black)
                  .size(16)
                  .make()
                  .px(25),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theamNotifier.isDark
                      ? mainDarkColor
                      : lightColorBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 154, 154, 154)),
                  // controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "faizanahmed@gmail.com",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 154, 154, 154)),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ).px(20),

              const SizedBox(
                height: 20,
              ),
              "Age"
                  .text
                  .bold
                  .color(theamNotifier.isDark ? Colors.white : Colors.black)
                  .size(16)
                  .make()
                  .px(25),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theamNotifier.isDark
                      ? mainDarkColor
                      : lightColorBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: ageController,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 154, 154, 154)),
                  // controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "e.g   (20, 15, 21)",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 154, 154, 154)),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (val) {
                    setState(() {});
                  },
                ),
              ).px(20),

              const SizedBox(
                height: 20,
              ),
              "Phone Number"
                  .text
                  .bold
                  .color(theamNotifier.isDark ? Colors.white : Colors.black)
                  .size(16)
                  .make()
                  .px(25),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: theamNotifier.isDark
                      ? mainDarkColor
                      : lightColorBackground,
                ),
                child: TextFormField(
                  controller: phoneController,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 154, 154, 154)),
                  // controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "e.g 92 306 2860258",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 154, 154, 154)),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (val) {
                    setState(() {});
                  },
                ),
              ).px(20),
              const SizedBox(
                height: 20,
              ),
              // "Address"
              //     .text
              //     .bold
              //     .color(theamNotifier.isDark ? Colors.white : mainColor)
              //     .size(16)
              //     .make()
              //     .px(22),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     color:
              //         theamNotifier.isDark ? mainDarkColor : Colors.white,
              //   ),
              //   child: TextFormField(
              //     controller: addressController,
              //     style: const TextStyle(
              //         fontSize: 14,
              //         color: Color.fromARGB(255, 154, 154, 154)),
              //     // controller: emailController,
              //     decoration: InputDecoration(
              //       hintText: (user!.data() as dynamic)['address'] == ""
              //           ? "e.g Gulshan Block 2"
              //           : (user!.data() as dynamic)['address'],
              //       hintStyle: const TextStyle(
              //           fontSize: 14,
              //           color: Color.fromARGB(255, 154, 154, 154)),
              //       disabledBorder: InputBorder.none,
              //       enabledBorder: InputBorder.none,
              //       border: InputBorder.none,
              //     ),
              //     onFieldSubmitted: (val) {
              //       setState(() {});
              //     },
              //   ),
              // ).px16(),
            ],
          ),
        ),
      );
    });
  }
}
