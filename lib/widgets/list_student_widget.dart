import 'package:flutter/material.dart';
import 'package:sqflite_sample/db/functions/db_functions.dart';

import '../db/Model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext context, List<StudentModel> studentList,
          Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {}
                      //_showForm(context, currentItem['key'])
                      
                      ),
                  IconButton(
                    onPressed: () {
                      if (data.id != null) {
                        deleteStudent(data.id!);
                      } else {
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
