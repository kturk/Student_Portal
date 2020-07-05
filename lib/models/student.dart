class Student{
  String firstName;
  String lastName;
  double grade;
  String _status;
  String photoLink;

  Student(String firstName, String lastName, double grade, String photoLink)
  {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.photoLink = photoLink;
  }

  String getStudentFullName(){
    return this.firstName + " " + this.lastName;
  }

  String get getStatus{
    String returnStatus = "";
    if (this.grade >= 60)
      returnStatus = "Passed";
    else
      returnStatus = "Failed";
    return returnStatus;
  }

}