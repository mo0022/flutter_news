import 'package:flutter/material.dart';
import 'package:new_pp/screens/CategoryScreen.dart';
import 'package:new_pp/screens/details.dart';
import 'package:new_pp/screens/home_screen.dart';
import 'package:new_pp/screens/splash_screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        "/details": (context) => Details(),
        '/category': (context) => Categoryscreen(),
      },
      home: SplashScreen(),
    );
  }
}
