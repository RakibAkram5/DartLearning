import 'dart:io';

double calculatePercentage(List<double> marks) {
  double total = 0;

  for (double mark in marks) {
    total += mark;
  }

  return (total / 300) * 100;
}

String calculateGrade(double percentage) {
  if (percentage >= 80) {
    return "A+";
  } else if (percentage >= 70) {
    return "A";
  } else if (percentage >= 60) {
    return "B";
  } else if (percentage >= 50) {
    return "C";
  } else {
    return "Fail";
  }
}

void main() {
  print("===== Student Grade Calculator =====");

  print("Enter Student Name:");
  String name = stdin.readLineSync()!;

  List<double> marks = [];

  for (int i = 1; i <= 3; i++) {
    print("Enter marks for Subject $i:");
    double mark = double.parse(stdin.readLineSync()!);

    marks.add(mark);
  }

  double percentage = calculatePercentage(marks);
  String grade = calculateGrade(percentage);

  print("\n===== Result =====");
  print("Student: $name");
  print("Percentage: ${percentage.toStringAsFixed(2)}%");
  print("Grade: $grade");

  if (grade == "Fail") {
    print("Status: Need Improvement");
  } else {
    print("Status: Passed");
  }
}