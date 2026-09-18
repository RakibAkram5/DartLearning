
import 'dart:io';

// ===============================
// PARENT CLASS
// ===============================

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void showBasicInfo() {
    print("Name: $name");
    print("Age: $age");
  }
}

// ===============================
// STUDENT CLASS
// ===============================

class Student extends Person {
  int rollNo;
  String className;

  // Encapsulation
  List<int> _marks = [];

  Student(
    String name,
    int age,
    this.rollNo,
    this.className,
    List<int> marks,
  ) : super(name, age) {
    _marks = marks;
  }

  // Calculate total marks
  int calculateTotal() {
    int total = 0;

    for (int mark in _marks) {
      total = total + mark;
    }

    return total;
  }

  // Calculate percentage
  double calculatePercentage() {
    int total = calculateTotal();

    double percentage = (total / 300) * 100;

    return percentage;
  }

  // Calculate grade
  String calculateGrade() {
    double percentage = calculatePercentage();

    if (percentage >= 80) {
      return "A";
    } else if (percentage >= 70) {
      return "B";
    } else if (percentage >= 60) {
      return "C";
    } else if (percentage >= 50) {
      return "D";
    } else {
      return "F";
    }
  }

  // Check result
  String checkResult() {
    double percentage = calculatePercentage();

    if (percentage >= 50) {
      return "PASS";
    } else {
      return "FAIL";
    }
  }

  // Show student information
  void showStudentInfo() {
    print("\n=================================");
    print("         STUDENT RESULT");
    print("=================================");

    print("Name       : $name");
    print("Age        : $age");
    print("Roll No    : $rollNo");
    print("Class      : $className");

    print("\nMarks:");

    print("English    : ${_marks[0]}");
    print("Maths      : ${_marks[1]}");
    print("Computer   : ${_marks[2]}");

    print("\nTotal      : ${calculateTotal()}/300");
    print(
      "Percentage : ${calculatePercentage().toStringAsFixed(2)}%",
    );
    print("Grade      : ${calculateGrade()}");
    print("Result     : ${checkResult()}");

    print("=================================\n");
  }
}

// ===============================
// TEACHER CLASS
// ===============================

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
    String name,
    int age,
    this.subject,
    this.salary,
  ) : super(name, age);

  void showTeacherInfo() {
    print("\n=================================");
    print("         TEACHER INFORMATION");
    print("=================================");

    print("Name       : $name");
    print("Age        : $age");
    print("Subject    : $subject");
    print("Salary     : Rs. ${salary.toStringAsFixed(0)}");

    print("=================================\n");
  }
}

// ===============================
// MAIN PROGRAM
// ===============================

void main() {
  // List to store students
  List<Student> students = [];

  // List to store teachers
  List<Teacher> teachers = [];

  bool isRunning = true;

  while (isRunning) {
    print("\n=================================");
    print("     ACADEMY MANAGEMENT SYSTEM");
    print("=================================");
    print("1. Add Student");
    print("2. Show All Students");
    print("3. Search Student");
    print("4. Add Teacher");
    print("5. Show All Teachers");
    print("6. Exit");
    print("=================================");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    // ===========================
    // ADD STUDENT
    // ===========================

    if (choice == "1") {
      print("\n===== ADD STUDENT =====");

      stdout.write("Enter student name: ");
      String name = stdin.readLineSync() ?? "";

      stdout.write("Enter age: ");
      int age = int.parse(stdin.readLineSync()!);

      stdout.write("Enter roll number: ");
      int rollNo = int.parse(stdin.readLineSync()!);

      stdout.write("Enter class: ");
      String className = stdin.readLineSync() ?? "";

      print("\nEnter Marks:");

      stdout.write("English marks: ");
      int english = int.parse(stdin.readLineSync()!);

      stdout.write("Maths marks: ");
      int maths = int.parse(stdin.readLineSync()!);

      stdout.write("Computer marks: ");
      int computer = int.parse(stdin.readLineSync()!);

      // Create Student object
      Student student = Student(
        name,
        age,
        rollNo,
        className,
        [english, maths, computer],
      );

      // Add student to List
      students.add(student);

      print("\nStudent added successfully!");
    }

    // ===========================
    // SHOW ALL STUDENTS
    // ===========================

    else if (choice == "2") {
      print("\n===== ALL STUDENTS =====");

      if (students.isEmpty) {
        print("No students found.");
      } else {
        for (Student student in students) {
          student.showStudentInfo();
        }
      }
    }

    // ===========================
    // SEARCH STUDENT
    // ===========================

    else if (choice == "3") {
      print("\n===== SEARCH STUDENT =====");

      stdout.write("Enter roll number: ");
      int searchRollNo = int.parse(stdin.readLineSync()!);

      bool found = false;

      for (Student student in students) {
        if (student.rollNo == searchRollNo) {
          student.showStudentInfo();
          found = true;
          break;
        }
      }

      if (found == false) {
        print("\nStudent not found.");
      }
    }

    // ===========================
    // ADD TEACHER
    // ===========================

    else if (choice == "4") {
      print("\n===== ADD TEACHER =====");

      stdout.write("Enter teacher name: ");
      String name = stdin.readLineSync() ?? "";

      stdout.write("Enter age: ");
      int age = int.parse(stdin.readLineSync()!);

      stdout.write("Enter subject: ");
      String subject = stdin.readLineSync() ?? "";

      stdout.write("Enter salary: ");
      double salary = double.parse(stdin.readLineSync()!);

      // Create Teacher object
      Teacher teacher = Teacher(
        name,
        age,
        subject,
        salary,
      );

      // Add teacher to List
      teachers.add(teacher);

      print("\nTeacher added successfully!");
    }

    // ===========================
    // SHOW ALL TEACHERS
    // ===========================

    else if (choice == "5") {
      print("\n===== ALL TEACHERS =====");

      if (teachers.isEmpty) {
        print("No teachers found.");
      } else {
        for (Teacher teacher in teachers) {
          teacher.showTeacherInfo();
        }
      }
    }

    // ===========================
    // EXIT
    // ===========================

    else if (choice == "6") {
      print("\nThank you for using Academy Management System!");

      isRunning = false;
    }

    // ===========================
    // INVALID CHOICE
    // ===========================

    else {
      print("\nInvalid choice! Please try again.");
    }
  }
}