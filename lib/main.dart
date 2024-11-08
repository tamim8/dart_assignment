import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app.dart';

/* This is the Task manager project assignment of ostad flutter batch seven
  * Module 18 Assignment
  * Completed by TAMIM HASAN 
  * Date: 08-11-2024
  */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const App());
}
