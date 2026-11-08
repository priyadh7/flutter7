
import 'dart:convert';
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentHome(),
    );
  }
}

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  List<String> students = [];

  @override
  void initState() {
    super.initState();

    // Create student object
    Student student = Student(
      id: 1,
      name: 'Raj',
      course: 'CSE',
    );

    // Convert object to JSON
    Map<String, dynamic> data = student.toJson();

    print('Student JSON: $data');

    // Convert JSON map to JSON string
    String jsonString = jsonEncode(data);
    print('JSON String: $jsonString');

    // Convert JSON string back to object
    Map<String, dynamic> decodedData =
        jsonDecode(jsonString);

    Student newStudent = Student.fromJson(decodedData);

    print('Student Name: ${newStudent.name}');
    print('Student Course: ${newStudent.course}');
  }

  void addStudent() {
    setState(() {
      students.add('Raj');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          const Text(
            'Application State Management',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: addStudent,
            child: const Text('Add Student'),
          ),

          const SizedBox(height: 20),

          const Text(
            'Student List',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(students[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
