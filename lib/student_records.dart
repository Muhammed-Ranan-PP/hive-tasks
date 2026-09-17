import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; 

class StudentRecords extends StatefulWidget {
  const StudentRecords({super.key});
  

  @override
  State<StudentRecords> createState() => _StudentRecordsState();
}

class _StudentRecordsState extends State<StudentRecords> {
  Map? student;
  final box = Hive.box('student');
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final domainController = TextEditingController();
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
            SizedBox(height: 5,),
            ElevatedButton(onPressed: (){
             final name = nameController.text.toString();
             final age = int.parse(ageController.text);
             final domain = domainController.text.toString();
             box.put(1, {
              "name" : name,
              "age":age,
              "domain":domain
             });
             final student = box.get(1);
             print(student);
            }, child: Text("Save"))
            ]
            ),
      ),
    );
  }
}
