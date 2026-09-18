void printResult(List<int> marks) {
  int failcount = 0;
  int passcount = 0;
  double average = 0.0;
  int sum = 0;

  for (int i = 0; i < marks.length; i++) {
    if (marks[i] >= 40) {
      print("Roll No ${i + 1}: ${marks[i]} - Pass");
      passcount++;
    } else {
      print("Roll No ${i + 1}: ${marks[i]} - Fail");
      failcount++;
    }

    sum += marks[i];
  }

  print("Total Passed: $passcount");
  print("Total Failed: $failcount");

  if (marks.isNotEmpty) {
    average = sum / marks.length;
  }

  print("Average Marks: $average");
}
void main(){
  List<int>marks=[45,78,92,33,67,88,51,29,95,60];
  printResult(marks);
}