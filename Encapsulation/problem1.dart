class Student {
  int _marks = 0;
  void setMarks(int marks) {
    if (marks >= 0 && marks <= 100) {
      _marks = marks;
    } else {
      print("Invalid Marks.");
    }
  }

  int getmarks() {
    return _marks;
  }
}

void main() {
  Student student = Student();
  student.setMarks(80);
  print(student.getmarks());
}
