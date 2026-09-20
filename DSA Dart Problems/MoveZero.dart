void moveZero(List<int> nums) {
  int insertPos = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      nums[insertPos] = nums[i];
      insertPos++;
    }
  }
  while (insertPos < nums.length) {
    nums[insertPos] = 0;
    insertPos++;
  }
}

void main() {
  List<int> nums = [0, 1, 0, 3, 12];
  moveZero(nums);
  print(nums);
}
