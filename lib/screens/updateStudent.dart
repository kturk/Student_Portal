import 'package:Flutter_demo/models/student.dart';
import 'package:Flutter_demo/validation/studentValidation.dart';
import 'package:flutter/material.dart';

class UpdateStudent extends StatefulWidget {
  Student selectedStudent;

  UpdateStudent(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {
    return _UpdateStudentState(selectedStudent);
  }
}

class _UpdateStudentState extends State<UpdateStudent> with StudentValidationMixin {
  Student selectedStudent;

  _UpdateStudentState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Student Info"),
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "First Name", hintText: "Kemal"),
      validator: validateName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Last Name", hintText: "Turk"),
      validator: validateName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  TextFormField buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Grade", hintText: "70.5"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = double.parse(value);
      },
    );
  }

  RaisedButton buildRaisedButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          Navigator.pop(context);
        }
      },
    );
  }
}