import 'package:flutter/material.dart';
import 'package:jobgo/const/colors.dart';
import 'package:jobgo/features/screen/auth/screen/congratulation_screen.dart';
import 'package:jobgo/features/screen/auth/screen/signupscreen.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double baseWidth = 375; // Base width for scaling
    final double scaleFactor = size.width / baseWidth;

    return Consumer<TheamModal>(
      builder: (context, theamNotifier, child) {
        return Scaffold(
          backgroundColor: theamNotifier.isDark ? darkColor : Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0 * scaleFactor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.15),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28 * scaleFactor,
                    fontWeight: FontWeight.bold,
                    color: theamNotifier.isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 10 * scaleFactor),
                Text(
                  'Fill your details or continue with social media',
                  style: TextStyle(
                    fontSize: 16 * scaleFactor,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 40 * scaleFactor),
                Container(
                  decoration: BoxDecoration(
                    color: theamNotifier.isDark
                        ? mainDarkColor
                        : lightColorBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(fontSize: 14 * scaleFactor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32 * scaleFactor),
                Container(
                  decoration: BoxDecoration(
                    color: theamNotifier.isDark
                        ? mainDarkColor
                        : lightColorBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 14 * scaleFactor),
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
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10 * scaleFactor),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14 * scaleFactor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20 * scaleFactor),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const CongratulationsScreen()),
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15 * scaleFactor),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: mainColor,
                    ),
                    child: Center(
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 17 * scaleFactor,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35 * scaleFactor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 18 * scaleFactor,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10 * scaleFactor),
                      child: Text(
                        'Or Continue with',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14 * scaleFactor,
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 18 * scaleFactor,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 25 * scaleFactor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'asset/images/fb_logo.png',
                        height: 50 * scaleFactor,
                      ),
                    ),
                    SizedBox(width: 20 * scaleFactor),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'asset/images/google_logo.png',
                        height: 45 * scaleFactor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30 * scaleFactor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User? ',
                      style: TextStyle(
                        color:
                            theamNotifier.isDark ? Colors.white : Colors.black,
                        fontSize: 14 * scaleFactor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 14 * scaleFactor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20 * scaleFactor),
              ],
            ),
          ),
        );
      },
    );
  }
}
