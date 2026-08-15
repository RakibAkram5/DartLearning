import "dart:io";

void main() {
  // for (int i = 0; i <= 10; i++) {
  //   print("i: $i");
  // }
  // stdout.write("Enter the Number: ");
  // int number = int.parse(stdin.readLineSync()!);
  // for (int i = 1; i <= 10; i++) {
  //   // O(n)
  //   int multiplication = number * i;
  //   print("$number X $i = $multiplication");
  // }
  // List<String> student = ["Ali", "Ahmad", "Usman", "Hamza", "Bilal"];
  // List<int> number = [10, 20, 30, 40, 50];
  // print(student);
  // print(student[0]); // accessing elements using indexes
  // for(int i=0;i<5;i++){
  //   print("Student[$i]=[$i]");
  // }
  List<int> number = [1, 2, 3, 4, 5];
  for (int i = 0; i < 5; i++) {
    print("Number: ${number[i]}");
  }
  print("First Element: ${number[0]}");
  print("Last Element: ${number[4]}");
  int length = number.length;
  print("Length: $length");
  number.add(10);
  for (int i = 0; i < number.length; i++) {
    print(number[i]);
  }
  number.addAll([20, 30, 40]);
  for (int i = 0; i < number.length; i++) {
    print(number[i]);
  }
  number.remove(1);
   for (int i = 0; i < number.length; i++) {
    print(number[i]);
  }
  
}
