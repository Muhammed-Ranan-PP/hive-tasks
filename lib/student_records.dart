import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_hive/model/student_model.dart';
import 'package:practice_hive/services/student_service.dart'; 
import 'package:practice_hive/student_list.dart';

class StudentRecords extends StatefulWidget {
  const StudentRecords({super.key});
  

  @override
  State<StudentRecords> createState() => _StudentRecordsState();
}

class _StudentRecordsState extends State<StudentRecords> {
  final studentService = StudentService();
  final box = Hive.box('student');
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final domainController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(style: TextStyle(color: Colors.white),"Student Records"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller:nameController ,
              decoration: InputDecoration(
                hintText: "Name", ),),
            TextField(controller: ageController,
              decoration: InputDecoration(
                hintText: "Age"),),
            TextField(controller: domainController,
              decoration: InputDecoration(
                hintText: "Domain"),),
                TextField(controller: addressController,
              decoration: InputDecoration(
                hintText: "Address"),),
            SizedBox(height: 5,),
            ElevatedButton(onPressed: (){
             final name = nameController.text.toString();
             final age = int.parse(ageController.text);
             final domain = domainController.text.toString();
             final address = addressController.text.toString();
             final student = Student(
               name:name,
               age:age,
               domain:domain,
               address: address
             );
             studentService.addStudent(student);
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const StudentList()));
              
            }, child: Text("Save"))
            ]
            ),
      ),
    );
  }
}
