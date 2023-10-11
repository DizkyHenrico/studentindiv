class StudentModel {
  int? id;

  final String name;

  final String age;

  StudentModel({required this.name, required this.age, this.id});
  static StudentModel fromDatabase(Map<String, Object?> data) {
    return StudentModel(
      name: data['name'] as String,
      age: data['age'] as String,
      id: data['id'] as int,
    );
  }
}
