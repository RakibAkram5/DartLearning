import "dart:io";

void main() {
  stdout.write("Enter your Salary: ");
  double salary = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the Bonus: ");
  double bonus = double.parse(stdin.readLineSync()!);
  double total_salary = salary + bonus;
  print("Total Salary: $total_salary");
}
