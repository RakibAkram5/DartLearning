// =============================================================
// E-Commerce Order Management System
// Concepts used: Classes, Objects, Constructors, Encapsulation,
// Getters/Setters, Inheritance, Method Overriding, Lists,
// Conditions, Loops, Methods.
// No abstract, implements, mixin, or factory constructors used.
// =============================================================

// -------------------------------------------------------------
// 1. Base Product class (encapsulated)
// -------------------------------------------------------------
class Product {
  // Private fields -> encapsulation
  String _id;
  String _name;
  double _price;
  int _stock;

  Product(this._id, this._name, double price, int stock)
      : _price = price < 0 ? 0 : price,
        _stock = stock < 0 ? 0 : stock;

  // Getters
  String get id => _id;
  String get name => _name;
  double get price => _price;
  int get stock => _stock;

  // Setters with validation
  set price(double newPrice) {
    if (newPrice < 0) {
      print('Error: Price cannot be negative. Keeping old price for $_name.');
    } else {
      _price = newPrice;
    }
  }

  set stock(int newStock) {
    if (newStock < 0) {
      print('Error: Stock cannot be negative. Keeping old stock for $_name.');
    } else {
      _stock = newStock;
    }
  }

  // Reduce stock safely (used internally by Order)
  bool reduceStock(int quantity) {
    if (quantity <= 0) return false;
    if (quantity > _stock) return false;
    _stock -= quantity;
    return true;
  }

  // Restore stock (used when a product is removed from an order)
  void restoreStock(int quantity) {
    if (quantity > 0) {
      _stock += quantity;
    }
  }

  // Base display method (will be overridden)
  void displayInfo() {
    print('Product ID: $_id');
    print('Name: $_name');
    print('Price: Rs. ${_price.toStringAsFixed(2)}');
    print('Stock: $_stock');
  }
}

// -------------------------------------------------------------
// 2. Inheritance: Electronics, Clothing, Grocery
// -------------------------------------------------------------
class Electronics extends Product {
  String _brand;
  int _warrantyYears;

  Electronics(String id, String name, double price, int stock, this._brand,
      this._warrantyYears)
      : super(id, name, price, stock);

  String get brand => _brand;
  int get warrantyYears => _warrantyYears;

  set brand(String newBrand) => _brand = newBrand;
  set warrantyYears(int years) {
    if (years >= 0) {
      _warrantyYears = years;
    } else {
      print('Error: Warranty years cannot be negative.');
    }
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('Category: Electronics');
    print('Brand: $_brand');
    print('Warranty: $_warrantyYears year(s)');
  }
}

class Clothing extends Product {
  String _size;
  String _color;

  Clothing(String id, String name, double price, int stock, this._size,
      this._color)
      : super(id, name, price, stock);

  String get size => _size;
  String get color => _color;

  set size(String newSize) => _size = newSize;
  set color(String newColor) => _color = newColor;

  @override
  void displayInfo() {
    super.displayInfo();
    print('Category: Clothing');
    print('Size: $_size');
    print('Color: $_color');
  }
}

class Grocery extends Product {
  String _expiryDate;

  Grocery(String id, String name, double price, int stock, this._expiryDate)
      : super(id, name, price, stock);

  String get expiryDate => _expiryDate;
  set expiryDate(String newDate) => _expiryDate = newDate;

  @override
  void displayInfo() {
    super.displayInfo();
    print('Category: Grocery');
    print('Expiry Date: $_expiryDate');
  }
}

// -------------------------------------------------------------
// 3. OrderItem - pairs a Product with a purchased quantity
//    (kept as a plain class; not required by the spec by name,
//    but needed so an Order can track "Product x Quantity")
// -------------------------------------------------------------
class OrderItem {
  Product _product;
  int _quantity;

  OrderItem(this._product, int quantity) : _quantity = quantity < 0 ? 0 : quantity;

  Product get product => _product;
  int get quantity => _quantity;

  set quantity(int newQuantity) {
    if (newQuantity < 0) {
      print('Error: Quantity cannot be negative.');
    } else {
      _quantity = newQuantity;
    }
  }

  double get itemTotal => _product.price * _quantity;

  void increaseQuantity(int amount) {
    if (amount > 0) _quantity += amount;
  }
}

// -------------------------------------------------------------
// 4. Order class
// -------------------------------------------------------------
class Order {
  String _orderId;
  String _customerName;
  List<OrderItem> _items = [];
  bool _isCheckedOut = false;

  Order(this._orderId, this._customerName);

  String get orderId => _orderId;
  String get customerName => _customerName;
  List<OrderItem> get items => _items; // read-only exposure of the list
  bool get isCheckedOut => _isCheckedOut;

  // ---- Add product with quantity check against stock ----
  void addProduct(Product product, int quantity) {
    if (_isCheckedOut) {
      print('Cannot modify order: already checked out.');
      return;
    }

    if (quantity <= 0) {
      print('Error: Quantity must be greater than zero.');
      return;
    }

    if (quantity > product.stock) {
      print(
          'Cannot add "${product.name}": requested $quantity but only ${product.stock} in stock.');
      return;
    }

    // If product already exists in the order, just increase quantity
    for (var item in _items) {
      if (item.product.id == product.id) {
        bool reduced = product.reduceStock(quantity);
        if (reduced) {
          item.increaseQuantity(quantity);
          print('Added $quantity more of "${product.name}" to the order.');
        }
        return;
      }
    }

    // Otherwise create a new order item
    bool reduced = product.reduceStock(quantity);
    if (reduced) {
      _items.add(OrderItem(product, quantity));
      print('Added "${product.name}" x $quantity to the order.');
    } else {
      print('Failed to add "${product.name}" due to insufficient stock.');
    }
  }

  // ---- Remove product from order ----
  void removeProduct(String productId) {
    if (_isCheckedOut) {
      print('Cannot modify order: already checked out.');
      return;
    }

    OrderItem? found;
    for (var item in _items) {
      if (item.product.id == productId) {
        found = item;
        break;
      }
    }

    if (found == null) {
      print('Error: Product with ID "$productId" not found in this order.');
      return;
    }

    found.product.restoreStock(found.quantity);
    _items.remove(found);
    print('Removed "${found.product.name}" from the order. Stock restored.');
  }

  // ---- Calculations ----
  double calculateSubtotal() {
    double subtotal = 0;
    for (var item in _items) {
      subtotal += item.itemTotal;
    }
    return subtotal;
  }

  double calculateDiscountPercentage() {
    double subtotal = calculateSubtotal();
    if (subtotal < 10000) {
      return 0;
    } else if (subtotal < 50000) {
      return 5;
    } else if (subtotal < 100000) {
      return 10;
    } else {
      return 15;
    }
  }

  double calculateDiscountAmount() {
    double subtotal = calculateSubtotal();
    double percentage = calculateDiscountPercentage();
    return subtotal * (percentage / 100);
  }

  double calculateFinalTotal() {
    return calculateSubtotal() - calculateDiscountAmount();
  }

  // ---- Checkout ----
  void checkout() {
    if (_items.isEmpty) {
      print('Cannot checkout an empty order.');
      return;
    }

    _isCheckedOut = true;
    print('Order placed successfully.');
    displayOrderInfo();
  }

  // ---- Display full order info ----
  void displayOrderInfo() {
    print('----------------------------------------');
    print('Order ID: $_orderId');
    print('Customer: $_customerName');
    print('Status: ${_isCheckedOut ? "Checked Out" : "Pending"}');
    print('Items:');

    if (_items.isEmpty) {
      print('  (No items in this order)');
    } else {
      for (var item in _items) {
        print(
            '  ${item.product.name} x ${item.quantity} = Rs. ${item.itemTotal.toStringAsFixed(2)}');
      }
    }

    double subtotal = calculateSubtotal();
    double discountPercent = calculateDiscountPercentage();
    double discountAmount = calculateDiscountAmount();
    double finalTotal = calculateFinalTotal();

    print('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}');
    print('Discount: $discountPercent% (Rs. ${discountAmount.toStringAsFixed(2)})');
    print('Final Total: Rs. ${finalTotal.toStringAsFixed(2)}');
    print('----------------------------------------');
  }
}

// -------------------------------------------------------------
// 5. main() - demonstration
// -------------------------------------------------------------
void main() {
  // ---- Create products ----
  Electronics laptop = Electronics('E1', 'Laptop', 85000, 5, 'Dell', 2);
  Electronics phone = Electronics('E2', 'Smartphone', 45000, 8, 'Samsung', 1);

  Clothing tshirt = Clothing('C1', 'T-Shirt', 1500, 10, 'M', 'Blue');
  Clothing jeans = Clothing('C2', 'Jeans', 3500, 6, 'L', 'Black');

  Grocery milk = Grocery('G1', 'Milk', 200, 20, '2026-09-05');
  Grocery bread = Grocery('G2', 'Bread', 150, 15, '2026-09-02');

  print('===== Product Catalog =====');
  laptop.displayInfo();
  print('');
  phone.displayInfo();
  print('');
  tshirt.displayInfo();
  print('');
  jeans.displayInfo();
  print('');
  milk.displayInfo();
  print('');
  bread.displayInfo();
  print('');

  // ---- Create an order ----
  Order order = Order('ORD1001', 'Ali Raza');

  print('===== Adding Products to Order =====');
  order.addProduct(laptop, 1);   // valid
  order.addProduct(tshirt, 3);   // valid
  order.addProduct(milk, 2);     // valid

  // ---- Attempt invalid stock purchase ----
  print('');
  print('===== Attempting Invalid Purchase =====');
  order.addProduct(jeans, 20); // only 6 in stock -> should fail

  // ---- Remove a product ----
  print('');
  print('===== Removing a Product =====');
  order.removeProduct('G1'); // remove milk

  // ---- Show subtotal, discount, final bill ----
  print('');
  print('===== Order Summary Before Checkout =====');
  order.displayOrderInfo();

  // ---- Checkout ----
  print('');
  print('===== Checkout =====');
  order.checkout();

  // ---- Try modifying after checkout ----
  print('');
  print('===== Attempting to Modify After Checkout =====');
  order.addProduct(phone, 1);
  order.removeProduct('C1');

  // ---- Show remaining stock ----
  print('');
  print('===== Remaining Stock Check =====');
  print('Laptop stock: ${laptop.stock}');
  print('T-Shirt stock: ${tshirt.stock}');
  print('Milk stock: ${milk.stock}'); // restored after removal
  print('Jeans stock: ${jeans.stock}'); // unchanged, purchase failed
}