import 'package:Flutter_demo/models/student.dart';
import 'package:Flutter_demo/validation/studentValidation.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  List<Student> students;

  AddStudent(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _AddStudentState(students);
  }
}

class _AddStudentState extends State<AddStudent> with StudentValidationMixin {
  List<Student> students;

  _AddStudentState(List<Student> students) {
    this.students = students;
  }

  var formKey = GlobalKey<FormState>();
  Student student = Student.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildRaisedButton(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name", hintText: "Kemal"),
      validator: validateName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name", hintText: "Turk"),
      validator: validateName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  TextFormField buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Grade", hintText: "70.5"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = double.parse(value);
      },
    );
  }

  RaisedButton buildRaisedButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          students.add(student);
          print(student.firstName);
          print(student.lastName);
          print(student.grade.toString());
          //print(students[3].getStudentFullName());
          Navigator.pop(context);
        }
      },
    );
  }
}
