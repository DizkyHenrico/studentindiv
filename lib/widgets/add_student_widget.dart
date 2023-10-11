import 'package:flutter/material.dart';
import 'package:sqflite_sample/db/Model/data_model.dart';
import 'package:sqflite_sample/db/functions/db_functions.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _namecontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _agecontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClicked();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Student'))
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final name = _namecontroller.text.trim();
    final age = _agecontroller.text.trim();
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    // print('$_name $_age');
    final studentModel = StudentModel(name: name, age: age);
    addstudent(studentModel);
  }
}
