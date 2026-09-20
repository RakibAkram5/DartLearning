void main() {
  // Creation
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ['Ali', 'Sara', 'Ahmed'];
  List<int> fixed = List.filled(3, 0); // [0, 0, 0]

  // Access
  print(numbers[0]);        // 1
  print(numbers.first);     // 1
  print(numbers.last);      // 5
  print(numbers.length);    // 5

  // Add / Remove
  numbers.add(6);           // [1,2,3,4,5,6]
  numbers.insert(0, 0);     // [0,1,2,3,4,5,6]  O(n)
  numbers.remove(0);        // removes first 0
  numbers.removeAt(0);      // removes by index
  numbers.removeLast();     // removes last

  // Useful methods
  print(numbers.contains(3));      // true
  print(numbers.indexOf(3));       // 2
  print(numbers.sublist(1, 3));    // [2, 3]
  print(numbers.reversed.toList());
  print(numbers.isEmpty);
  print(numbers.isNotEmpty);

  // map, where, reduce, fold (VERY IMPORTANT for Flutter)
  List<int> doubled = numbers.map((n) => n * 2).toList();
  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  int sum = numbers.reduce((a, b) => a + b);
  int total = numbers.fold(0, (sum, n) => sum + n);

  // Sorting
  numbers.sort();
  numbers.sort((a, b) => b.compareTo(a)); // descending
}