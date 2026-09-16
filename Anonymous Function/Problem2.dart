void main() {
  double itemPrice = 250.75;
  int quantity = 3;

  double totalPrice = itemPrice * quantity;
  double discount = 0.10 * totalPrice;
  double finalPrice = totalPrice - discount;

  print("Item Price: $itemPrice");
  print("Quantity: $quantity");
  print("Total: $totalPrice");
  print("Discount (10%): $discount");
  print("Final Price: $finalPrice");
}
