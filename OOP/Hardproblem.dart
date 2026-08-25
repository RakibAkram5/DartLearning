// ===============================
// UNIVERSITY MANAGEMENT SYSTEM
// ===============================

// Parent Class
class Person {
  // Encapsulation
  String _name;
  int _age;

  // Constructor
  Person(this._name, this._age);

  // Getters
  String get name => _name;
  int get age => _age;

  // Setters
  set name(String value) {
    _name = value;
  }

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Invalid age");
    }
  }

  // Parent method
  void showDetails() {
    print("Name: $_name");
    print("Age: $_age");
  }
}

// =================================
// Student Class - Inheritance
// =================================

class Student extends Person {
  int _rollNo;
  double _cgpa;

  // Constructor + super
  Student(
    String name,
    int age,
    this._rollNo,
    this._cgpa,
  ) : super(name, age);

  // Getter
  int get rollNo => _rollNo;
  double get cgpa => _cgpa;

  // Setter with validation
  set cgpa(double value) {
    if (value >= 0.0 && value <= 4.0) {
      _cgpa = value;
    } else {
      print("Invalid CGPA");
    }
  }

  // Method Overriding
  @override
  void showDetails() {
    print("----- Student Details -----");
    print("Name: $name");
    print("Age: $age");
    print("Roll No: $_rollNo");
    print("CGPA: $_cgpa");
  }
}

// =================================
// Teacher Class - Inheritance
// =================================

class Teacher extends Person {
  int employeeId;
  String subject;
  double salary;

  // Constructor
  Teacher(
    String name,
    int age,
    this.employeeId,
    this.subject,
    this.salary,
  ) : super(name, age);

  // Method Overriding
  @override
  void showDetails() {
    print("----- Teacher Details -----");
    print("Name: $name");
    print("Age: $age");
    print("Employee ID: $employeeId");
    print("Subject: $subject");
    print("Salary: $salary");
  }
}

// =================================
// University Class
// =================================

class University {
  List<Student> students = [];

  // Add student
  void addStudent(Student student) {
    students.add(student);
  }

  // Dart alternative to method overloading
  // Search using either rollNo OR name
  void searchStudent({int? rollNo, String? name}) {
    if (rollNo != null) {
      for (Student student in students) {
        if (student.rollNo == rollNo) {
          print("Student Found:");
          student.showDetails();
          return;
        }
      }

      print("Student with Roll No $rollNo not found.");
    } 
    
    else if (name != null) {
      for (Student student in students) {
        if (student.name.toLowerCase() == name.toLowerCase()) {
          print("Student Found:");
          student.showDetails();
          return;
        }
      }

      print("Student with name $name not found.");
    } 
    
    else {
      print("Please provide Roll No or Name.");
    }
  }
}

// =================================
// MAIN
// =================================

void main() {

  // Creating Student Objects
  Student student1 = Student(
    "Rakib",
    25,
    101,
    3.2,
  );

  Student student2 = Student(
    "Ali",
    23,
    102,
    3.7,
  );

  // Creating Teacher Object
  Teacher teacher1 = Teacher(
    "Ahmed",
    40,
    501,
    "Computer Science",
    85000,
  );

  // ===============================
  // Encapsulation
  // ===============================

  print("Old CGPA: ${student1.cgpa}");

  student1.cgpa = 3.8;

  print("New CGPA: ${student1.cgpa}");

  // Invalid CGPA
  student1.cgpa = 5.0;

  print("CGPA after invalid update: ${student1.cgpa}");

  // ===============================
  // Method Overriding
  // ===============================

  print("\n");

  student1.showDetails();

  print("\n");

  student2.showDetails();

  print("\n");

  teacher1.showDetails();

  // ===============================
  // University
  // ===============================

  University university = University();

  university.addStudent(student1);
  university.addStudent(student2);

  // Search by Roll No
  print("\n===== Search By Roll No =====");

  university.searchStudent(rollNo: 101);

  // Search by Name
  print("\n===== Search By Name =====");

  university.searchStudent(name: "Ali");

  // No parameter
  print("\n===== Empty Search =====");

  university.searchStudent();

  // ===============================
  // Polymorphism Preview
  // ===============================

  print("\n===== People Details =====");

  List<Person> people = [
    student1,
    student2,
    teacher1,
  ];

  for (Person person in people) {
    person.showDetails();
    print("");
  }
}