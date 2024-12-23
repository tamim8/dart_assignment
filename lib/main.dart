// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
// import 'firebase_options.dart';

/* This is the E-Commerce project (GetX) assignment of ostad flutter batch seven
  * Module 19 Assignment
  * Completed by TAMIM HASAN 
  * Date: 12-2024
  */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const App());
}
