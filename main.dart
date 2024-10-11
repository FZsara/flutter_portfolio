import 'package:flutter/material.dart';
import 'home.dart';
import 'personal_info.dart';
import 'project.dart';
import 'skills.dart';
import 'experience.dart';
import 'dart:async'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.orangeAccent,
      ),
      initialRoute: '/splash', 
      routes: {
        '/splash': (context) => const SplashScreen(),  
        '/': (context) => const HomePage(),
        '/personal_info': (context) => const PersonalInfoPage(),
        '/skills': (context) => const SkillsPage(),
        '/projects': (context) => const ProjectPage(),
        '/experience': (context) => const QualificationTimeline(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset(
              'assets/images/logo.jpeg', 
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 20),
            // Text under the logo
            const Text(
              '< MY PORTFOLIO />',
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            // Circular progress indicator in red color
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
