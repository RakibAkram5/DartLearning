class Product {
  // ---------------- Properties ----------------

  int _id;
  String _name;
  double _price;
  int _stock;
  double _discount;

  // ---------------- Constructor ----------------

  Product(
    this._id,
    this._name,
    double price,
    int stock,
    double discount,
  ) : _price = 0,
       _stock = 0,
       _discount = 0 {
    // Price validation
    if (price < 0) {
      print("Error: Price cannot be negative. Setting price to 0.");
      _price = 0;
    } else {
      _price = price;
    }

    // Stock validation
    if (stock < 0) {
      print("Error: Stock cannot be negative. Setting stock to 0.");
      _stock = 0;
    } else {
      _stock = stock;
    }

    // Discount validation
    if (discount < 0 || discount > 100) {
      print(
        "Error: Discount must be between 0 and 100. Setting discount to 0.",
      );
      _discount = 0;
    } else {
      _discount = discount;
    }
  }

  // ---------------- Getters ----------------

  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  double get price {
    return _price;
  }

  int get stock {
    return _stock;
  }

  double get discount {
    return _discount;
  }

  // ---------------- Setters ----------------

  set id(int id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set price(double price) {
    if (price < 0) {
      print("Error: Price cannot be negative.");
    } else {
      _price = price;
    }
  }

  set stock(int stock) {
    if (stock < 0) {
      print("Error: Stock cannot be negative.");
    } else {
      _stock = stock;
    }
  }

  set discount(double discount) {
    if (discount < 0 || discount > 100) {
      print("Error: Discount must be between 0 and 100.");
    } else {
      _discount = discount;
    }
  }

  // ---------------- Methods ----------------

  double calculateDiscountedPrice() {
    double discountAmount = (_price * _discount) / 100;

    double finalPrice = _price - discountAmount;

    return finalPrice;
  }

  // ---------------- Sell Product ----------------

  void sellProduct(int quantity) {
    if (quantity <= 0) {
      print("Error: Quantity must be greater than 0.");
    } else if (quantity > _stock) {
      print(
        "Error: Not enough stock. Available stock is $_stock.",
      );
    } else {
      _stock = _stock - quantity;

      print(
        "$quantity item(s) sold. Remaining stock is $_stock.",
      );
    }
  }

  // ---------------- Restock Product ----------------

  void restock(int quantity) {
    if (quantity <= 0) {
      print("Error: Quantity must be greater than 0.");
    } else {
      _stock = _stock + quantity;

      print(
        "$quantity item(s) added. Current stock is $_stock.",
      );
    }
  }

  // ---------------- Display Product ----------------

  void displayProduct() {
    double finalPrice = calculateDiscountedPrice();

    print("----------------------------------");
    print("Product ID: $id");
    print("Product Name: $name");
    print("Original Price: Rs. $price");
    print("Discount: $discount%");
    print("Price After Discount: Rs. $finalPrice");
    print("Stock: $stock");
    print("----------------------------------");
  }
}

// ================= MAIN =================

void main() {
  // Create Product Object

  Product p1 = Product(
    101,
    "Wireless Headphones",
    2000,
    50,
    10,
  );

  // Display product
  p1.displayProduct();

  // Sell products
  print("\nSelling Product:");
  p1.sellProduct(5);

  // Restock products
  print("\nRestocking Product:");
  p1.restock(20);

  // Try invalid values
  print("\nTesting Invalid Values:");

  p1.price = -500;

  p1.stock = -10;

  p1.discount = 150;

  // Set correct values
  print("\nUpdating Product:");

  p1.discount = 25;

  p1.price = 1800;

  // Display updated product
  print("\nUpdated Product Details:");
  p1.displayProduct();

  // Try selling more than available stock
  print("\nTesting Stock Limit:");

  p1.sellProduct(1000);
}