import "dart:io";

void main() {
  stdout.write("Enter the Number: ");
  int number = int.parse(stdin.readLineSync()!);
  stdout.write("\n Enter the 2nd Number: ");
  int number_1 = int.parse(stdin.readLineSync()!);
  if (number > number_1) {
    stdout.write("$number is greater than $number_1");
  }
  else if(number<number_1){
    stdout.write("$number_1 is greater than $number");
  }
  else{
    stdout.write("$number_1 is Equal to $number");
  }
}
