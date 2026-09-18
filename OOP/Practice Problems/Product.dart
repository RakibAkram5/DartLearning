class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  double totalPrice() {
    return price * quantity;
  }

  void applyDiscount(double percent) {
    double discount = price * percent / 100;
    price = price - discount;
  }

  void display() {
    print("Name: $name");
    print("Price: $price");
    print("Quantity: $quantity");
    print("Total: ${totalPrice()}");
  }
}

void main() {
  Product product = Product(
    "Laptop",
    50000.0,
    2,
  );

  product.display();

  print("\nDiscount Applied: 10%");

  product.applyDiscount(10);

  print("New Price: ${product.price}");
  print("");

  product.display();
}