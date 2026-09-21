// ============================================================
// ACADEMY MANAGEMENT SYSTEM - PHASE 1 (single file version)
// Concepts: abstract class, encapsulation, getters/setters,
// constructors, inheritance, multi-level inheritance,
// method overriding, super, interface (implements), polymorphism
// ============================================================

// ---------- INTERFACE ----------
// Printable acts like an "interface" in Dart.
// Any class that "implements" this MUST provide its own printDetails().
abstract class Printable {
  void printDetails();
}

// ---------- ABSTRACT CLASS ----------
// Person cannot be used directly (you can't do Person p = Person(...)).
// It exists so Student, Teacher, ScholarshipStudent can extend it
// and share common properties + behavior.
abstract class Person {
  // Private fields (encapsulation) -> only accessible via getters/setters below.
  String _name;
  int _age;

  Person(this._name, this._age) {
    if (_age <= 0) {
      throw ArgumentError('Age must be greater than 0');
    }
  }

  // ----- Getters & Setters (with validation) -----
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

  // Abstract method -> every child class MUST override this.
  // This enables polymorphism later (List<Person>).
  void displayInfo();

  // A normal (non-abstract) method -> shared/reusable by all children.
  void basicInfo() {
    print('Name: $_name | Age: $_age');
  }
}

// ---------- STUDENT ----------
// Student EXTENDS Person (inheritance) and IMPLEMENTS Printable (interface).
class Student extends Person implements Printable {
  // final -> set once in constructor, never changed after (an ID shouldn't change)
  final String studentId;

  // private field with getter/setter validation
  String _email;

  // Collections come in Phase 2, declared here since Student "owns" this data.
  Set<String> enrolledCourses = {};
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

  // Method OVERRIDING the abstract method from Person.
  @override
  void displayInfo() {
    print('[Student] $name (ID: $studentId), Age: $age');
  }

  // Method required by the Printable interface.
  @override
  void printDetails() {
    print('---- Student Details ----');
    print('ID: $studentId');
    print('Name: $name');
    print('Age: $age');
    print('Email: $_email');
  }
}

// ---------- TEACHER ----------
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

// ---------- SCHOLARSHIP STUDENT ----------
// MULTI-LEVEL inheritance: Person -> Student -> ScholarshipStudent
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

  // Overriding again -> we override Student's override.
  // We call super.displayInfo() first, then ADD extra info.
  // This shows both "super" usage and polymorphism.
  @override
  void displayInfo() {
    super.displayInfo();
    print('   Scholarship: $_scholarshipPercentage%');
  }
}

// ---------- MAIN ----------
void main() {
  // Creating one object of each type
  Student s1 = Student('ST001', 'Ali', 20, 'ali@example.com');
  Teacher t1 = Teacher('TC001', 'Sara', 35, 'Mathematics', 80000);
  ScholarshipStudent sch1 =
      ScholarshipStudent('ST002', 'Hina', 21, 'hina@example.com', 50);

  // ----- POLYMORPHISM -----
  // A single list of the PARENT type holding different CHILD objects.
  List<Person> people = [s1, t1, sch1];

  print('===== Academy Members =====');
  for (Person p in people) {
    // Even though the list type is Person, Dart calls the correct
    // overridden displayInfo() for each actual object at runtime.
    p.displayInfo();
  }

  print('\n===== Printable Details =====');
  s1.printDetails();
  t1.printDetails();
}