import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_hive/model/student_model.dart';

class StudentService {
  final box = Hive.box('student');
  void addStudent(Student student) {
    box.add(student);
  }

  List getStudent() {
    return box.values.toList();
  }
  void updateStudent(int key,Student student){
    box.put(key,student);
  }
  Future<void> deleteStudent(int key) async{
    await box.delete(key);
  }
}
