import 'dart:io';

enum CourseStatus { active, completed, dropped }

abstract class Printable {
  void printDetails();
}

class AcademyException implements Exception {
  final String message;
  AcademyException(this.message);
  @override
  String toString() => message;
}

class DuplicateIdException extends AcademyException {
  DuplicateIdException(String message) : super(message);
}

class NotFoundException extends AcademyException {
  NotFoundException(String message) : super(message);
}

abstract class Person {
  String _name;
  int _age;

  Person(this._name, this._age) {
    if (_age <= 0) {
      throw ArgumentError('Age must be greater than 0');
    }
  }

  String get name => _name;
  set name(String value) {
    if (value.trim().isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    _name = value;
  }

  int get age => _age;
  set age(int value) {
    if (value <= 0) {
      throw ArgumentError('Age must be greater than 0');
    }
    _age = value;
  }

  void displayInfo();

  void basicInfo() {
    print('Name: $_name | Age: $_age');
  }
}

class Student extends Person implements Printable {
  final String studentId;
  String _email;

  Set<String> enrolledCourses = {};
  Map<String, CourseStatus> courseStatus = {};
  Map<String, int> marks = {};

  double _attendance = 0;

  Student(this.studentId, String name, int age, this._email)
      : super(name, age) {
    if (_email.trim().isEmpty || !_email.contains('@')) {
      throw ArgumentError('Invalid email for student $studentId');
    }
  }

  String get email => _email;
  set email(String value) {
    if (!value.contains('@')) {
      throw ArgumentError('Invalid email format');
    }
    _email = value;
  }

  double get attendance => _attendance;
  set attendance(double value) {
    if (value < 0 || value > 100) {
      throw ArgumentError('Attendance must be between 0 and 100');
    }
    _attendance = value;
  }

  void enrollCourse(String course) {
    if (enrolledCourses.contains(course)) {
      throw AcademyException('Already enrolled in $course');
    }
    enrolledCourses.add(course);
    courseStatus[course] = CourseStatus.active;
  }

  void addMark(String subject, int mark) {
    if (mark < 0 || mark > 100) {
      throw ArgumentError('Marks must be between 0 and 100');
    }
    marks[subject] = mark;
  }

  double get averageMarks {
    if (marks.isEmpty) return 0;
    int total = marks.values.fold(0, (sum, m) => sum + m);
    return total / marks.length;
  }

  int get highestMark =>
      marks.isEmpty ? 0 : marks.values.reduce((a, b) => a > b ? a : b);

  int get lowestMark =>
      marks.isEmpty ? 0 : marks.values.reduce((a, b) => a < b ? a : b);

  bool get isPassing => averageMarks >= 50;

  @override
  void displayInfo() {
    print('[Student] $name (ID: $studentId), Age: $age');
  }

  @override
  void printDetails() {
    print('---- Student Details ----');
    print('ID: $studentId');
    print('Name: $name');
    print('Age: $age');
    print('Email: $_email');
    print('Courses: $enrolledCourses');
    print('Attendance: $_attendance%');
  }
}

class Teacher extends Person implements Printable {
  final String teacherId;
  String _subject;
  double _salary;

  Teacher(this.teacherId, String name, int age, this._subject, this._salary)
      : super(name, age) {
    if (_salary < 0) {
      throw ArgumentError('Salary cannot be negative');
    }
    if (_subject.trim().isEmpty) {
      throw ArgumentError('Subject cannot be empty');
    }
  }

  String get subject => _subject;
  set subject(String value) {
    if (value.trim().isEmpty) {
      throw ArgumentError('Subject cannot be empty');
    }
    _subject = value;
  }

  double get salary => _salary;
  set salary(double value) {
    if (value < 0) {
      throw ArgumentError('Salary cannot be negative');
    }
    _salary = value;
  }

  @override
  void displayInfo() {
    print('[Teacher] $name (ID: $teacherId), Subject: $_subject');
  }

  @override
  void printDetails() {
    print('---- Teacher Details ----');
    print('ID: $teacherId');
    print('Name: $name');
    print('Age: $age');
    print('Subject: $_subject');
    print('Salary: $_salary');
  }
}

class ScholarshipStudent extends Student {
  double _scholarshipPercentage;

  ScholarshipStudent(
    String studentId,
    String name,
    int age,
    String email,
    this._scholarshipPercentage,
  ) : super(studentId, name, age, email) {
    if (_scholarshipPercentage < 0 || _scholarshipPercentage > 100) {
      throw ArgumentError('Scholarship percentage must be 0-100');
    }
  }

  double get scholarshipPercentage => _scholarshipPercentage;
  set scholarshipPercentage(double value) {
    if (value < 0 || value > 100) {
      throw ArgumentError('Scholarship percentage must be 0-100');
    }
    _scholarshipPercentage = value;
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('   Scholarship: $_scholarshipPercentage%');
  }
}

class Academy {
  static String academyName = 'Bright Future Academy';
  static int totalStudents = 0;
  static int totalTeachers = 0;

  List<Student> students = [];
  List<Teacher> teachers = [];

  void addStudent(Student s) {
    bool exists = students.any((st) => st.studentId == s.studentId);
    if (exists) {
      throw DuplicateIdException('Student ID ${s.studentId} already exists');
    }
    students.add(s);
    totalStudents++;
  }

  void addTeacher(Teacher t) {
    bool exists = teachers.any((tc) => tc.teacherId == t.teacherId);
    if (exists) {
      throw DuplicateIdException('Teacher ID ${t.teacherId} already exists');
    }
    teachers.add(t);
    totalTeachers++;
  }

  Student? findStudentById(String id) {
    for (var s in students) {
      if (s.studentId == id) return s;
    }
    return null;
  }

  Student? findStudentByName(String name) {
    for (var s in students) {
      if (s.name.toLowerCase() == name.toLowerCase()) return s;
    }
    return null;
  }

  Teacher? findTeacherById(String id) {
    for (var t in teachers) {
      if (t.teacherId == id) return t;
    }
    return null;
  }

  List<Student> filterStudents(bool Function(Student) condition) {
    return students.where(condition).toList();
  }

  bool Function(Student) gradeAboveChecker(int threshold) {
    return (Student student) => student.averageMarks > threshold;
  }

  void showStatistics() {
    int totalScholarship = students.whereType<ScholarshipStudent>().length;

    Set<String> allCourses = {};
    for (var s in students) {
      allCourses.addAll(s.enrolledCourses);
    }

    double avgMarks = students.isEmpty
        ? 0
        : students.map((s) => s.averageMarks).reduce((a, b) => a + b) /
            students.length;

    double avgAttendance = students.isEmpty
        ? 0
        : students.map((s) => s.attendance).reduce((a, b) => a + b) /
            students.length;

    int below75 = students.where((s) => s.attendance < 75).length;
    int above80 = students.where((s) => s.averageMarks > 80).length;

    print('===== Academy Statistics =====');
    print('Academy Name: $academyName');
    print('Total Students: $totalStudents');
    print('Total Teachers: $totalTeachers');
    print('Total Scholarship Students: $totalScholarship');
    print('Total Courses: ${allCourses.length}');
    print('Average Student Marks: ${avgMarks.toStringAsFixed(2)}');
    print('Average Attendance: ${avgAttendance.toStringAsFixed(2)}%');
    print('Students Below 75% Attendance: $below75');
    print('Students Above 80% Average Marks: $above80');
  }
}

Future<void> loadAcademyData() async {
  print('Loading academy data...');
  await Future.delayed(Duration(seconds: 2));
  print('Data loaded successfully.\n');
}

void addStudentFlow(Academy academy) {
  stdout.write('Enter Student ID: ');
  String id = stdin.readLineSync() ?? '';
  stdout.write('Enter Name: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Enter Age: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write('Enter Email: ');
  String email = stdin.readLineSync() ?? '';

  Student s = Student(id, name, age, email);
  academy.addStudent(s);
  print('Student added successfully.');
}

void addTeacherFlow(Academy academy) {
  stdout.write('Enter Teacher ID: ');
  String id = stdin.readLineSync() ?? '';
  stdout.write('Enter Name: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Enter Age: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write('Enter Subject: ');
  String subject = stdin.readLineSync() ?? '';
  stdout.write('Enter Salary: ');
  double salary = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  Teacher t = Teacher(id, name, age, subject, salary);
  academy.addTeacher(t);
  print('Teacher added successfully.');
}

void addScholarshipStudentFlow(Academy academy) {
  stdout.write('Enter Student ID: ');
  String id = stdin.readLineSync() ?? '';
  stdout.write('Enter Name: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Enter Age: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write('Enter Email: ');
  String email = stdin.readLineSync() ?? '';
  stdout.write('Enter Scholarship Percentage: ');
  double scholarship = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  ScholarshipStudent s = ScholarshipStudent(id, name, age, email, scholarship);
  academy.addStudent(s);
  print('Scholarship Student added successfully.');
}

void showAllStudents(Academy academy) {
  if (academy.students.isEmpty) {
    print('No students found.');
    return;
  }
  for (var s in academy.students) {
    s.displayInfo();
  }
}

void showAllTeachers(Academy academy) {
  if (academy.teachers.isEmpty) {
    print('No teachers found.');
    return;
  }
  for (var t in academy.teachers) {
    t.displayInfo();
  }
}

void searchStudentFlow(Academy academy) {
  stdout.write('Search by (1) ID or (2) Name: ');
  String? opt = stdin.readLineSync();
  stdout.write('Enter value: ');
  String value = stdin.readLineSync() ?? '';

  Student? found;
  if (opt == '1') {
    found = academy.findStudentById(value);
  } else if (opt == '2') {
    found = academy.findStudentByName(value);
  }

  if (found == null) {
    throw NotFoundException('Student not found.');
  }
  found.printDetails();
}

void enrollStudentFlow(Academy academy) {
  stdout.write('Enter Student ID: ');
  String id = stdin.readLineSync() ?? '';
  Student? student = academy.findStudentById(id);
  if (student == null) {
    throw NotFoundException('Student not found.');
  }

  stdout.write('Enter Course Name: ');
  String course = stdin.readLineSync() ?? '';

  student.enrollCourse(course);
  print('Enrolled in $course successfully.');
}

void markAttendanceFlow(Academy academy) {
  stdout.write('Enter Student ID: ');
  String id = stdin.readLineSync() ?? '';
  Student? student = academy.findStudentById(id);
  if (student == null) {
    throw NotFoundException('Student not found.');
  }

  stdout.write('Enter Attendance Percentage: ');
  double attendance = double.tryParse(stdin.readLineSync() ?? '') ?? -1;

  student.attendance = attendance;
  print('Attendance updated successfully.');
}

void addMarksFlow(Academy academy) {
  stdout.write('Enter Student ID: ');
  String id = stdin.readLineSync() ?? '';
  Student? student = academy.findStudentById(id);
  if (student == null) {
    throw NotFoundException('Student not found.');
  }

  stdout.write('Enter Subject: ');
  String subject = stdin.readLineSync() ?? '';
  stdout.write('Enter Marks: ');
  int marks = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  student.addMark(subject, marks);
  print('Marks added successfully.');
}

void showStudentResultFlow(Academy academy) {
  stdout.write('Enter Student ID: ');
  String id = stdin.readLineSync() ?? '';
  Student? student = academy.findStudentById(id);
  if (student == null) {
    throw NotFoundException('Student not found.');
  }

  print('---- Result ----');
  print('Name: ${student.name}');
  print('ID: ${student.studentId}');
  print('Subjects and Marks:');
  student.marks.forEach((subject, mark) {
    print('  $subject: $mark');
  });
  print('Average: ${student.averageMarks.toStringAsFixed(2)}');
  print('Highest: ${student.highestMark}');
  print('Lowest: ${student.lowestMark}');
  print('Attendance: ${student.attendance}%');
  print('Status: ${student.isPassing ? "Pass" : "Fail"}');
}

void filterStudentsFlow(Academy academy) {
  print('1. Average marks above 80');
  print('2. Attendance above 75');
  print('3. Scholarship students');
  print('4. Search by name keyword');
  stdout.write('Choose filter: ');
  String? opt = stdin.readLineSync();

  List<Student> result = [];

  switch (opt) {
    case '1':
      var checker = academy.gradeAboveChecker(80);
      result = academy.filterStudents(checker);
      break;
    case '2':
      result = academy.filterStudents((s) => s.attendance > 75);
      break;
    case '3':
      result = academy.filterStudents((s) => s is ScholarshipStudent);
      break;
    case '4':
      stdout.write('Enter keyword: ');
      String keyword = stdin.readLineSync() ?? '';
      result = academy.filterStudents(
          (s) => s.name.toLowerCase().contains(keyword.toLowerCase()));
      break;
    default:
      print('Invalid filter option.');
      return;
  }

  if (result.isEmpty) {
    print('No matching students found.');
  } else {
    for (var s in result) {
      s.displayInfo();
    }
  }
}

Future<void> main() async {
  await loadAcademyData();

  Academy academy = Academy();
  bool running = true;

  while (running) {
    print('================================');
    print('   ${Academy.academyName}');
    print('   ACADEMY MANAGEMENT SYSTEM');
    print('================================');
    print('1. Add Student');
    print('2. Add Teacher');
    print('3. Add Scholarship Student');
    print('4. Show All Students');
    print('5. Show All Teachers');
    print('6. Search Student');
    print('7. Enroll Student');
    print('8. Mark Attendance');
    print('9. Add Student Marks');
    print('10. Show Student Result');
    print('11. Filter Students');
    print('12. Academy Statistics');
    print('13. Exit');
    stdout.write('Enter your choice: ');

    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');

    if (choice == null) {
      print('Invalid input. Please enter a number.\n');
      continue;
    }

    try {
      switch (choice) {
        case 1:
          addStudentFlow(academy);
          break;
        case 2:
          addTeacherFlow(academy);
          break;
        case 3:
          addScholarshipStudentFlow(academy);
          break;
        case 4:
          showAllStudents(academy);
          break;
        case 5:
          showAllTeachers(academy);
          break;
        case 6:
          searchStudentFlow(academy);
          break;
        case 7:
          enrollStudentFlow(academy);
          break;
        case 8:
          markAttendanceFlow(academy);
          break;
        case 9:
          addMarksFlow(academy);
          break;
        case 10:
          showStudentResultFlow(academy);
          break;
        case 11:
          filterStudentsFlow(academy);
          break;
        case 12:
          academy.showStatistics();
          break;
        case 13:
          running = false;
          print('Exiting... Goodbye!');
          break;
        default:
          print('Invalid menu choice.');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (running) print('');
    }
  }
}
