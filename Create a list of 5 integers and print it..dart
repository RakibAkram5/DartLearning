// ============================================================
// 35 Dart List Practice Problems — Solutions
// ============================================================

void main() {
  // ---------------- BASICS ----------------

  // 1. Create a list of 5 integers and print it.
  List<int> nums = [10, 20, 30, 40, 50];
  print('1. $nums');

  // 2. Find the length of a list.
  print('2. Length: ${nums.length}');

  // 3. Access the first and last elements of a list.
  print('3. First: ${nums.first}, Last: ${nums.last}');

  // 4. Add an element to the end of a list.
  nums.add(60);
  print('4. After add: $nums');

  // 5. Insert an element at a specific index.
  nums.insert(2, 25);
  print('5. After insert at index 2: $nums');

  // 6. Remove an element by value.
  nums.remove(25);
  print('6. After remove(25): $nums');

  // 7. Remove an element by index.
  nums.removeAt(0);
  print('7. After removeAt(0): $nums');

  // 8. Check if a list contains a specific element.
  print('8. Contains 40? ${nums.contains(40)}');

  // 9. Clear all elements from a list.
  List<int> tempList = [1, 2, 3];
  tempList.clear();
  print('9. After clear: $tempList');

  // 10. Reverse a list without using a built-in reverse method.
  print('10. Reversed: ${reverseList([1, 2, 3, 4, 5])}');

  // ---------------- SEARCHING & SORTING ----------------

  List<int> sample = [12, 45, 3, 67, 23, 8, 67];

  // 11. Find the maximum and minimum values in a list.
  print('11. Max: ${findMax(sample)}, Min: ${findMin(sample)}');

  // 12. Find the index of the first occurrence of an element.
  print('12. Index of 67: ${sample.indexOf(67)}');

  // 13. Count how many times a value appears in a list.
  print('13. Count of 67: ${countOccurrences(sample, 67)}');

  // 14. Sort a list of integers in ascending order.
  List<int> asc = List.from(sample)..sort();
  print('14. Ascending: $asc');

  // 15. Sort a list of integers in descending order.
  List<int> desc = List.from(sample)..sort((a, b) => b.compareTo(a));
  print('15. Descending: $desc');

  // 16. Sort a list of strings alphabetically.
  List<String> fruits = ['banana', 'apple', 'cherry', 'date'];
  fruits.sort();
  print('16. Sorted strings: $fruits');

  // 17. Implement a simple linear search on a list.
  print('17. Linear search 23: ${linearSearch(sample, 23)}');

  // 18. Implement binary search on a sorted list.
  List<int> sorted = List.from(sample)..sort();
  print('18. Binary search 45 in $sorted: ${binarySearch(sorted, 45)}');

  // ---------------- MANIPULATION ----------------

  // 19. Remove duplicate elements from a list.
  print('19. Without duplicates: ${removeDuplicates(sample)}');

  // 20. Merge two lists into one.
  List<int> listA = [1, 2, 3];
  List<int> listB = [4, 5, 6];
  print('20. Merged: ${mergeLists(listA, listB)}');

  // 21. Find the intersection of two lists (common elements).
  List<int> listC = [1, 2, 3, 4];
  List<int> listD = [3, 4, 5, 6];
  print('21. Intersection: ${intersection(listC, listD)}');

  // 22. Find the difference between two lists.
  print('22. Difference (C - D): ${difference(listC, listD)}');

  // 23. Swap two elements in a list by their indices.
  List<int> swapDemo = [1, 2, 3, 4, 5];
  swapElements(swapDemo, 0, 4);
  print('23. After swap(0,4): $swapDemo');

  // 24. Rotate a list left by n positions.
  print('24. Rotated left by 2: ${rotateLeft([1, 2, 3, 4, 5], 2)}');

  // 25. Split a list into two halves.
  var halves = splitInHalf([1, 2, 3, 4, 5, 6, 7]);
  print('25. First half: ${halves[0]}, Second half: ${halves[1]}');

  // 26. Flatten a nested list (list of lists) into a single list.
  List<List<int>> nested = [
    [1, 2],
    [3, 4, 5],
    [6]
  ];
  print('26. Flattened: ${flatten(nested)}');

  // ---------------- MATH & AGGREGATION ----------------

  List<int> mathList = [4, 8, 15, 16, 23, 42];

  // 27. Calculate the sum of all elements in a list.
  print('27. Sum: ${sumList(mathList)}');

  // 28. Calculate the average of elements in a list.
  print('28. Average: ${averageList(mathList)}');

  // 29. Separate even and odd numbers into two different lists.
  var evenOdd = separateEvenOdd(mathList);
  print('29. Even: ${evenOdd[0]}, Odd: ${evenOdd[1]}');

  // 30. Find the second largest number in a list.
  print('30. Second largest: ${secondLargest(mathList)}');
}

// ============================================================
// FUNCTION DEFINITIONS
// ============================================================

// 10. Reverse a list without using a built-in reverse method.
List<int> reverseList(List<int> list) {
  List<int> result = [];
  for (int i = list.length - 1; i >= 0; i--) {
    result.add(list[i]);
  }
  return result;
}

// 11. Find max and min without built-in reduce/max functions.
int findMax(List<int> list) {
  int max = list[0];
  for (var n in list) {
    if (n > max) max = n;
  }
  return max;
}

int findMin(List<int> list) {
  int min = list[0];
  for (var n in list) {
    if (n < min) min = n;
  }
  return min;
}

// 13. Count occurrences of a value.
int countOccurrences(List<int> list, int value) {
  int count = 0;
  for (var n in list) {
    if (n == value) count++;
  }
  return count;
}

// 17. Linear search — returns index or -1 if not found.
int linearSearch(List<int> list, int target) {
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) return i;
  }
  return -1;
}

// 18. Binary search — list must be sorted. Returns index or -1.
int binarySearch(List<int> list, int target) {
  int low = 0;
  int high = list.length - 1;
  while (low <= high) {
    int mid = (low + high) ~/ 2;
    if (list[mid] == target) {
      return mid;
    } else if (list[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}

// 19. Remove duplicates while preserving order.
List<int> removeDuplicates(List<int> list) {
  List<int> result = [];
  for (var n in list) {
    if (!result.contains(n)) result.add(n);
  }
  return result;
  // Alternative one-liner: list.toSet().toList();
}

// 20. Merge two lists.
List<int> mergeLists(List<int> a, List<int> b) {
  return [...a, ...b];
  // Alternative: a + b;
}

// 21. Intersection of two lists.
List<int> intersection(List<int> a, List<int> b) {
  return a.where((element) => b.contains(element)).toList();
}

// 22. Difference between two lists (elements in a but not in b).
List<int> difference(List<int> a, List<int> b) {
  return a.where((element) => !b.contains(element)).toList();
}

// 23. Swap two elements by index (in place).
void swapElements(List<int> list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

// 24. Rotate a list left by n positions.
List<int> rotateLeft(List<int> list, int n) {
  if (list.isEmpty) return list;
  n = n % list.length;
  return [...list.sublist(n), ...list.sublist(0, n)];
}

// 25. Split a list into two halves.
List<List<int>> splitInHalf(List<int> list) {
  int mid = (list.length / 2).ceil();
  List<int> firstHalf = list.sublist(0, mid);
  List<int> secondHalf = list.sublist(mid);
  return [firstHalf, secondHalf];
}

// 26. Flatten a nested list.
List<int> flatten(List<List<int>> nested) {
  List<int> result = [];
  for (var sub in nested) {
    result.addAll(sub);
  }
  return result;
  // Alternative: nested.expand((e) => e).toList();
}

// 27. Sum of all elements.
int sumList(List<int> list) {
  int sum = 0;
  for (var n in list) {
    sum += n;
  }
  return sum;
  // Alternative: list.reduce((a, b) => a + b);
}

// 28. Average of elements.
double averageList(List<int> list) {
  if (list.isEmpty) return 0;
  return sumList(list) / list.length;
}

// 29. Separate even and odd numbers.
List<List<int>> separateEvenOdd(List<int> list) {
  List<int> evens = [];
  List<int> odds = [];
  for (var n in list) {
    if (n % 2 == 0) {
      evens.add(n);
    } else {
      odds.add(n);
    }
  }
  return [evens, odds];
}

// 30. Second largest number in a list.
int secondLargest(List<int> list) {
  int largest = -1 << 62;
  int second = -1 << 62;
  for (var n in list) {
    if (n > largest) {
      second = largest;
      largest = n;
    } else if (n > second && n != largest) {
      second = n;
    }
  }
  return second;
}