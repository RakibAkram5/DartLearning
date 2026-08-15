import "dart:io";

void main() {
  stdout.write("Enter Your Marks: ");
  double marks = double.parse(stdin.readLineSync()!);
  if (marks >= 50) {
    print("Pass");
  } else {
    print("Fail.");
  }
}
