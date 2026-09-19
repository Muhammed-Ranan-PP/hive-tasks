import 'package:flutter/material.dart';
import 'package:practice_hive/services/student_service.dart';


class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final studentService = StudentService();
  @override
  Widget build(BuildContext context) {
    final students = studentService.getStudent();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(style: TextStyle(color: Colors.white),"Student Records"),
      ),
      body: ListView.builder(itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index]; 
        return ListTile(
  title: Text(student.name),
  subtitle: Text(student.domain),
);
      },),
    );
  }
}