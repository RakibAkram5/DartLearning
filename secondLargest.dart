int? secondLargest(List<int> numbers) {
  if (numbers.length < 2) {
    return null;
  }

  int? largest;
  int? secondLargest;

  for (int number in numbers) {
    // Duplicate largest ko ignore karo
    if (number == largest) {
      continue;
    }

    if (largest == null || number > largest) {
      secondLargest = largest;
      largest = number;
    } else if (secondLargest == null || number > secondLargest) {
      secondLargest = number;
    }
  }

  return secondLargest;
}

void main() {
  print(secondLargest([10, 5, 20, 20, 8, 10])); // 10
  print(secondLargest([5, 5, 5]));               // null
  print(secondLargest([10]));                    // null
  print(secondLargest([]));                      // null
  print(secondLargest([5, 10]));                 // 5
  print(secondLargest([10, 10, 8, 8, 5]));       // 8
}