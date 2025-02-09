import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/auth/logic/auth_logic.dart';
import 'package:jobgo/features/screen/auth/screen/loginscreen.dart';
import 'package:jobgo/features/screen/bottom_navigation_bar/bottom_nav_bar_screen.dart';
import 'package:jobgo/main.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:jobgo/utils/snackbar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisible = false;
  bool isLoading = false;

  void googleSignUp() async {
    setState(() {
      isLoading = true;
    });

    User? user = await AuthMethods().signInWithGoogle();
    setState(() {
      isLoading = false;
    });
    if (user != null) {
      // ignore: use_build_context_synchronously
      showSnackBar("User signed in: ${user.displayName}", context);
      box1.put('isLogedIn', true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const CustomBottomNavBarUser()),
        (route) => false,
      );
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar("User signed in failed", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<TheamModal>(
      builder: (context, theamNotifier, child) {
        return Scaffold(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Text(
                      'Register Account',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.bold,
                        color:
                            theamNotifier.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    const Text(
                      'Fill your details or continue with social media',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    _buildTextField(
                      hint: 'User Name',
                      icon: Icons.person_outline_rounded,
                      theamNotifier: theamNotifier,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildTextField(
                      hint: 'Email Address',
                      icon: Icons.email_outlined,
                      theamNotifier: theamNotifier,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildTextField(
                      hint: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: !isVisible,
                      suffixIcon: IconButton(
                        icon: isVisible
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      theamNotifier: theamNotifier,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>
                                const CustomBottomNavBarUser(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor,
                        ),
                        child: const Center(
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    _buildDivider(),
                    SizedBox(height: screenHeight * 0.03),
                    _buildSocialIcons(),
                    SizedBox(height: screenHeight * 0.03),
                    _buildLoginPrompt(theamNotifier),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
              if (isLoading) // Show loading animation
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Lottie.asset(
                        'asset/images/loading.json', // Make sure to add an animation file
                        height: 200,
                        repeat: true,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    required TheamModal theamNotifier,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: theamNotifier.isDark ? mainDarkColor : lightColorBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 1, width: 18, color: Colors.grey),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or Continue with',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(height: 1, width: 18, color: Colors.grey),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'asset/images/fb_logo.png',
            height: 50,
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {
            googleSignUp();
          },
          icon: Image.asset(
            'asset/images/google_logo.png',
            height: 45,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginPrompt(TheamModal theamNotifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
              color: theamNotifier.isDark ? Colors.white : Colors.black,
              fontSize: 17),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text(
            'Log In',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
