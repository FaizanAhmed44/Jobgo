import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jobgo/features/screen/auth/screen/loginscreen.dart';
import 'package:jobgo/features/screen/bottom_navigation_bar/bottom_nav_bar_screen.dart';
import 'package:jobgo/features/screen/onboarding/screen/onboarding_screen.dart';
import 'package:jobgo/theme/theme_modal.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late Box box1;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  box1 = await Hive.openBox('jobgo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
        create: (_) => TheamModal(),
        child: Consumer<TheamModal>(
            builder: (context, TheamModal theamModal, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: theamModal.isDark
                ? ThemeData.dark().copyWith(
                    textTheme: GoogleFonts.exo2TextTheme(textTheme),
                    primaryTextTheme: const TextTheme(),
                  )
                : ThemeData.light().copyWith(
                    textTheme: GoogleFonts.exo2TextTheme(textTheme),
                    primaryTextTheme: const TextTheme(),
                  ),
            home: box1.get('isLogedIn', defaultValue: false)
                ? const CustomBottomNavBarUser()
                : const OnboardingScreen(),
          );
        }));
  }
}
