class StudentValidationMixin {
  String validateName(String value) {
    if (value.length < 2)
      return "Name length cannot be less than 2.";
    else if (value.length > 30) return "Name length cannot be longer than 30.";
  }

  String validateGrade(String value) {
    if (double.tryParse(value) == null) return "Please enter a number.";

    double grade = double.parse(value);

    if (grade < 0 || grade > 100) return "Grade must be between 0-100.";
  }
}
