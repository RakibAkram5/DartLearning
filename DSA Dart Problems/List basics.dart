void main() {
  // Creation
  List<int> nums = [1, 2, 3, 4, 5];
  List<int> zeros = List.filled(5, 0);       // [0, 0, 0, 0, 0]

  // Access — O(1)
  print(nums[0]);          // 1
  print(nums.length);      // 5
  print(nums.last);        // 5

  // Add / Remove
  nums.add(6);             // [1,2,3,4,5,6]  O(1)
  nums.removeAt(0);        // [2,3,4,5,6]    O(n)
  nums.removeLast();       // [2,3,4,5]      O(1)

  // Swap (no built-in swap in Dart)
  int temp = nums[0];
  nums[0] = nums[1];
  nums[1] = temp;

  // Slicing
  print(nums.sublist(1, 3));  // [3, 4]

  // Reverse
  print(nums.reversed.toList());

  // Sort — O(n log n)
  nums.sort();
  nums.sort((a, b) => b.compareTo(a)); // descending
}