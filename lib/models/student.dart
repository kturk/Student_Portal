class Student {
  String firstName;
  String lastName;
  double grade;
  String _status;
  String photoLink =
      "https://image.shutterstock.com/z/stock-photo-confident-handsome-student-holding-books-and-smiling-at-camera-library-bookshelves-on-background-366568778.jpg";

  // Empty constructor
  Student.empty();

  // Full constructor
  Student(String firstName, String lastName, double grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String getStudentFullName() {
    return this.firstName + " " + this.lastName;
  }

  String get getStatus {
    String returnStatus = "";
    if (this.grade >= 60)
      returnStatus = "Passed";
    else
      returnStatus = "Failed";
    return returnStatus;
  }
}
