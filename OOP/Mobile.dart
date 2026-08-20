import "dart:io";

class Mobile {
  String _brand;
  String _model;
  double _price;

  // Constructor
  Mobile(this._brand, this._model, this._price);

  // Apply Discount
  double applyDiscount(double percentage) {
    if (_price > 0 && percentage >= 0 && percentage <= 100) {
      double discount = _price * percentage / 100;
      _price -= discount;

      return _price;
    } else {
      print("Invalid Price or Discount.");
      return _price;
    }
  }

  // Setters
  void setBrand(String brand) {
    this._brand = brand;
  }

  void setModel(String model) {
    this._model = model;
  }

  void setPrice(double price) {
    if (price >= 0) {
      this._price = price;
    } else {
      print("Price cannot be negative.");
    }
  }

  // Getters
  String getBrand() {
    return _brand;
  }

  String getModel() {
    return _model;
  }

  double getPrice() {
    return _price;
  }

  // Display
  void displayMobile() {
    print("Brand: $_brand");
    print("Model: $_model");
    print("Price: $_price");
  }
}

void main() {
  Mobile m1 = Mobile("Samsung", "A36", 12093.443);

  m1.displayMobile();

  print("\nApplying 10% discount...");

  m1.applyDiscount(10);

  print("\nAfter Discount:");
  m1.displayMobile();
}