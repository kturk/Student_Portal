import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddStudentState();
  }

}

class _AddStudentState extends State<AddStudent>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student"),
      ),
      body: Center(
        child: Text("From will be here"),
      ),
    );
  }

}