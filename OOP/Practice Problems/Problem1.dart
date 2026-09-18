class Student{
  String name;
  int age;
  String grade;
  Student(this.name,this.age,this.grade);
  void displayinfo(){
    print("Name: $name");
    print("Age: $age");
    print("Grade: $grade");
  }
}
void main(){
  Student s1=Student("Ali",16,"A");
  Student s2=Student("Sara",15,"B");
  s1.displayinfo();
  s2.displayinfo();
}