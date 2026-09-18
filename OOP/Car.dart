import "dart:io";

class Car {
  String brand;
  int model;
  double price;

  // Constructor
  Car(this.brand, this.model, this.price);

  // Method to display car information
  void display() {
    stdout.write("-----------------------------------\n");
    stdout.write("Brand: $brand\n");
    stdout.write("Model: $model\n");
    stdout.write("Price: $price\n");
  }

  // Method to apply discount
  double discount(double percentage) {
    double discountAmount = price * percentage / 100;
    price -= discountAmount;
    return price;
  }
}

void main() {
  // Object
  Car c1 = Car("Audi", 2026, 180000.3213);

  // Display original information
  c1.display();

  // Apply 15% discount
  double finalPrice = c1.discount(15);

  print("Price after 15% discount: $finalPrice");
}