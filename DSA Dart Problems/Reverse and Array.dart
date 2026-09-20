void reverseArray(List<int> nums) {
  int left = 0;
  int right = nums.length - 1;

  while (left < right) {
    int temp = nums[left];
    nums[left] = nums[right];
    nums[right] = temp;
    left++;
    right--;
  }
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5];
  reverseArray(nums);
  print(nums); // [5, 4, 3, 2, 1]
}
