import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'auth_screen.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';
import 'train_safety_screen.dart';
import 'parent_club_screen.dart';
import 'school_for_parents_screen.dart';
import 'alumni_chronicle_screen.dart';
import 'museum_screen.dart';
import 'theater_screen.dart';

void main() {
  runApp(const DeltaApp());
}

class DeltaApp extends StatelessWidget {
  const DeltaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delta App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => HomeScreen(
          userData: ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {},
        ),
        '/train_safety': (context) => const TrainSafetyScreen(),
        '/parent_club': (context) => const ParentsClubScreen(),
        '/school_for_parents': (context) => const ParentsSchoolScreen(),
        '/alumni_chronicle': (context) => const AlumniChronicleScreen(),
        '/museum': (context) => const MuseumScreen(),
        '/theater': (context) => const TheaterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}