void main() {
  // Creation
  Map<String, int> ages = {
    'Ali': 25,
    'Sara': 30,
    'Ahmed': 28,
  };

  // Access
  print(ages['Ali']);           // 25
  print(ages['Unknown']);       // null
  print(ages.keys.toList());    // [Ali, Sara, Ahmed]
  print(ages.values.toList());  // [25, 30, 28]

  // Add / Update / Remove
  ages['Bilal'] = 22;
  ages['Ali'] = 26;             // update
  ages.remove('Sara');

  // Safe access
  print(ages['Unknown'] ?? 0);  // 0 (null coalescing)

  // Important methods
  ages.putIfAbsent('Hina', () => 24);
  ages.update('Ali', (v) => v + 1);

  // Iteration
  ages.forEach((key, value) {
    print('$key is $value years old');
  });

  // map, where
  Map<String, int> doubled = ages.map((k, v) => MapEntry(k, v * 2));
}