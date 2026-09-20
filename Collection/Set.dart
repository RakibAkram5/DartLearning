void main() {
  Set<int> numbers = {1, 2, 3, 3, 3}; // {1, 2, 3}
  Set<String> names = {'Ali', 'Sara'};

  // Add / Remove
  numbers.add(4);
  numbers.remove(1);
  print(numbers.contains(2)); // true

  // Set operations (VERY useful)
  Set<int> a = {1, 2, 3, 4};
  Set<int> b = {3, 4, 5, 6};

  print(a.union(b));         // {1,2,3,4,5,6}
  print(a.intersection(b));  // {3,4}
  print(a.difference(b));    // {1,2}

  // From List to Set (remove duplicates)
  List<int> withDupes = [1, 1, 2, 2, 3];
  Set<int> unique = withDupes.toSet(); // {1,2,3}
}