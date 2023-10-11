import 'package:flutter/material.dart';
import 'package:sqflite_sample/db/functions/db_functions.dart';
import 'package:sqflite_sample/screen_home.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenHome(),
    );
  }
}
