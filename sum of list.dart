import "dart:io";

void main() {
  List<int> numbers = [];
  stdout.write("Enter the Elements in the List ");
  print(""); 

  for (int i = 0; i < 5; i++) {
    stdout.write("Element ${i + 1}: ");
    int? element = int.tryParse(stdin.readLineSync() ?? "");
    if (element == null) {
      print("Invalid input, try again.");
      i--; 
      continue;
    }
    numbers.add(element);
  }

  print("You entered: $numbers");
  print("Sum: ${numbers.reduce((a, b) => a + b)}");
  print("Max: ${numbers.reduce((a, b) => a > b ? a : b)}");
}