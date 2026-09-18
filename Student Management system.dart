import "dart:io";

void main() {
  List<String> students = [];
  List<int> rollNumbers = [];
  List<int> marks = [];

  int choice;

  do {
    print("\n====== Student Marks Management System ======");
    print("1. Add Student");
    print("2. Show All Students");
    print("3. Search Student");
    print("4. Update Marks");
    print("5. Delete Student");
    print("6. Show Highest Marks");
    print("7. Show Lowest Marks");
    print("8. Show Average Marks");
    print("9. Show Passed Students");
    print("10. Show Failed Students");
    print("11. Exit");

    stdout.write("Enter Your Choice: ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      // ================= ADD STUDENT =================
      case 1:
        stdout.write("Enter Student Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter Roll Number: ");
        int roll = int.parse(stdin.readLineSync()!);

        // Check duplicate roll number
        bool exists = false;

        for (int i = 0; i < rollNumbers.length; i++) {
          if (rollNumbers[i] == roll) {
            exists = true;
            break;
          }
        }

        if (exists) {
          print("Roll Number already exists!");
        } else {
          stdout.write("Enter Marks: ");
          int mark = int.parse(stdin.readLineSync()!);

          if (mark < 0 || mark > 100) {
            print("Marks must be between 0 and 100.");
          } else {
            students.add(name);
            rollNumbers.add(roll);
            marks.add(mark);

            print("Student Added Successfully!");
          }
        }

        break;

      // ================= SHOW ALL STUDENTS =================
      case 2:
        if (students.isEmpty) {
          print("No students available.");
        } else {
          print("\n=========== All Students ===========");

          for (int i = 0; i < students.length; i++) {
            print("\nRoll No: ${rollNumbers[i]}");
            print("Name: ${students[i]}");
            print("Marks: ${marks[i]}");
          }
        }

        break;

      // ================= SEARCH STUDENT =================
      case 3:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        stdout.write("Enter Roll Number: ");
        int find = int.parse(stdin.readLineSync()!);

        bool found = false;

        for (int i = 0; i < students.length; i++) {
          if (find == rollNumbers[i]) {
            print("\nStudent Found!");
            print("Roll No: ${rollNumbers[i]}");
            print("Name: ${students[i]}");
            print("Marks: ${marks[i]}");

            found = true;
            break;
          }
        }

        if (!found) {
          print("Student Not Found.");
        }

        break;

      // ================= UPDATE MARKS =================
      case 4:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        stdout.write("Enter Roll Number: ");
        int roll = int.parse(stdin.readLineSync()!);

        bool found = false;

        for (int i = 0; i < rollNumbers.length; i++) {
          if (rollNumbers[i] == roll) {
            stdout.write("Enter New Marks: ");
            int newMarks = int.parse(stdin.readLineSync()!);

            if (newMarks < 0 || newMarks > 100) {
              print("Marks must be between 0 and 100.");
            } else {
              marks[i] = newMarks;
              print("Marks Updated Successfully!");
            }

            found = true;
            break;
          }
        }

        if (!found) {
          print("Student Not Found.");
        }

        break;

      // ================= DELETE STUDENT =================
      case 5:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        stdout.write("Enter Roll Number: ");
        int roll = int.parse(stdin.readLineSync()!);

        bool found = false;

        for (int i = 0; i < rollNumbers.length; i++) {
          if (rollNumbers[i] == roll) {
            students.removeAt(i);
            rollNumbers.removeAt(i);
            marks.removeAt(i);

            print("Student Deleted Successfully!");

            found = true;
            break;
          }
        }

        if (!found) {
          print("Student Not Found.");
        }

        break;

      // ================= HIGHEST MARKS =================
      case 6:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        int highestIndex = 0;

        for (int i = 1; i < marks.length; i++) {
          if (marks[i] > marks[highestIndex]) {
            highestIndex = i;
          }
        }

        print("\n=========== Highest Marks ===========");
        print("Name: ${students[highestIndex]}");
        print("Roll No: ${rollNumbers[highestIndex]}");
        print("Marks: ${marks[highestIndex]}");

        break;

      // ================= LOWEST MARKS =================
      case 7:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        int lowestIndex = 0;

        for (int i = 1; i < marks.length; i++) {
          if (marks[i] < marks[lowestIndex]) {
            lowestIndex = i;
          }
        }

        print("\n=========== Lowest Marks ===========");
        print("Name: ${students[lowestIndex]}");
        print("Roll No: ${rollNumbers[lowestIndex]}");
        print("Marks: ${marks[lowestIndex]}");

        break;

      // ================= AVERAGE =================
      case 8:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        int total = 0;

        for (int mark in marks) {
          total += mark;
        }

        double average = total / marks.length;

        print("\n=========== Average Marks ===========");
        print("Total Marks: $total");
        print("Total Students: ${students.length}");
        print("Average Marks: ${average.toStringAsFixed(2)}");

        break;

      // ================= PASSED STUDENTS =================
      case 9:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        bool passed = false;

        print("\n=========== Passed Students ===========");

        for (int i = 0; i < students.length; i++) {
          if (marks[i] >= 50) {
            print(
              "${students[i]} - Roll No: ${rollNumbers[i]} - Marks: ${marks[i]}",
            );

            passed = true;
          }
        }

        if (!passed) {
          print("No student has passed.");
        }

        break;

      // ================= FAILED STUDENTS =================
      case 10:
        if (students.isEmpty) {
          print("No students available.");
          break;
        }

        bool failed = false;

        print("\n=========== Failed Students ===========");

        for (int i = 0; i < students.length; i++) {
          if (marks[i] < 50) {
            print(
              "${students[i]} - Roll No: ${rollNumbers[i]} - Marks: ${marks[i]}",
            );

            failed = true;
          }
        }

        if (!failed) {
          print("No student has failed.");
        }

        break;

      // ================= EXIT =================
      case 11:
        print("Program Exit...");
        break;

      // ================= INVALID =================
      default:
        print("Invalid Choice!");
    }
  } while (choice != 11);
}
