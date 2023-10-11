import 'package:flutter/foundation.dart';

import 'package:sqflite/sqflite.dart';

import '../Model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database database;
Future<void> initDataBase() async {
  database = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
    },
  );
}

Future<void> addstudent(StudentModel value) async {
  database.rawInsert(
      'INSERT INTO student(name, age) VALUES(?,?)', [value.name, value.age]);
  getAllStudents();
}

Future<void> getAllStudents() async {
  final values = await database.rawQuery('SELECT * FROM student');
  final studentDB =
      values.map((data) => StudentModel.fromDatabase(data)).toList();
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB);
  // studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
 await database.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  getAllStudents();
}
