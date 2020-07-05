import 'package:flutter/material.dart';
import 'models/student.dart';

void main() {
  runApp(MaterialApp(home: Exam()));
}

class Exam extends StatefulWidget {
  @override
  _ExamState createState() => _ExamState();

  static List<Student> buildStudentList() {
    List<Student> students = [];
    students.add(Student("Kemal", "Turk", 18, "https://image.shutterstock.com/z/stock-photo-confident-handsome-student-holding-books-and-smiling-at-camera-library-bookshelves-on-background-366568778.jpg"));
    students.add(Student("Can", "Yavuzkurt", 78, "https://image.shutterstock.com/z/stock-photo-confident-handsome-student-holding-books-and-smiling-at-camera-library-bookshelves-on-background-366568778.jpg"));
    students.add(Student("Caner", "Tanguler", 55.5, "https://image.shutterstock.com/z/stock-photo-confident-handsome-student-holding-books-and-smiling-at-camera-library-bookshelves-on-background-366568778.jpg"));

    return students;
  }
}

class _ExamState extends State<Exam> {
  String titleMessage = "Welcome to Exam Result Portal";

  List<Student> students = Exam.buildStudentList();

  String selectedStudentName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleMessage),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return buildStudentListTile(context, index);
              }),
        ),
        Row(
          children: <Widget>[
            addButton(),
            modifyButton(),
            deleteButton(),
          ],
        ),
      ],
    );
  }

  Flexible deleteButton() {
    return Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              color: Colors.redAccent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete_forever),
                  SizedBox(width: 5.0,),
                  Text("Delete"),
                ],
              ),
              onPressed: () {},
            ),
          );
  }

  Flexible modifyButton() {
    return Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              color: Colors.greenAccent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.update),
                  SizedBox(width: 5.0,),
                  Text("Modify"),
                ],
              ),
              onPressed: () {},
            ),
          );
  }

  Flexible addButton() {
    return Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_circle),
                  SizedBox(width: 5.0,),
                  Text("Add"),
                ],
              ),
              onPressed: () {},
            ),
          );
  }

  ListTile buildStudentListTile(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(students[index].photoLink),
      ),
      title: Text(students[index].getStudentFullName()),
      subtitle: Text("Grade of your exam: " + students[index].grade.toString() + " ["+students[index].getStatus+"]"),
      trailing: buildStatusIcon(students[index].grade),
      onTap: (){
        setState(() {
          selectedStudentName = students[index].getStudentFullName();
        });
      },
    );
  }

  void showExamResultMessage(String examResultMessage, BuildContext context) {
    var examResultDialog = AlertDialog(
      title: Text("Result of your exam"),
      content: Text(examResultMessage + ""),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) => examResultDialog);
  }

  String returnExamResultMessage() {
    int examResult = 50;
    String examResultMessage = "";
    if (examResult >= 60)
      examResultMessage = "Passed";
    else
      examResultMessage = "Failed";
    return examResultMessage;
  }

  Widget buildStatusIcon(double grade) {
    if (grade >= 60)
      return Icon(Icons.done);
    else
      return Icon(Icons.clear);
  }
}
