import 'package:flutter/material.dart';
import 'package:sqflite_sample/widgets/add_student_widget.dart';
import 'package:sqflite_sample/widgets/list_student_widget.dart';

import '../db/functions/db_functions.dart';



class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          const Expanded(child: ListStudentWidget()),
        ],
      )),
    );
  }
}
