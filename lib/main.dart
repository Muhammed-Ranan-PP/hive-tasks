import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_hive/student_records.dart';
void main()async{
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
await Hive.openBox('student');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: StudentRecords(),
    );
  }
}
