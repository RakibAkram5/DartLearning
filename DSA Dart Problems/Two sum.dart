List<int> twoSum(List<int> nums, int target) {
  int left = 0;
  int right = nums.length - 1;

  while (left < right) {
    int sum = nums[left] + nums[right];

    if (sum == target) {
      return [left, right];
    } else if (sum < target) {
      left++;
    } else {
      right--;
    }
  }
  return [];
}

void main() {
  print(twoSum([2, 7, 11, 15], 9));    // [0, 1]
  print(twoSum([1, 3, 4, 6, 8], 10));  // [2, 3]
}