import 'package:flutter/material.dart';
import 'package:google_maps_and_geolocator/home_screen.dart';

/* This is the 21th assignment of ostad flutter batch seven
  * Completed by TAMIM HASAN 
  * Date: 07-12-2024
  */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Location Tracker',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }

  ThemeData get appTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
      ),
    );
  }
}
