abstract class Payment {
  void pay(double amount);
}

class CreditCard extends Payment {
  @override
  void pay(double amount) {
    print("Paid Rs.$amount via Credit Card");
  }
}

class JazzCash extends Payment {
  @override
  void pay(double amount) {
    print("Paid Rs.$amount via JazzCash");
  }
}

class EasyPaisa extends Payment {
  @override
  void pay(double amount) {
    print("Paid Rs.$amount via EasyPaisa");
  }
}

void main() {
  List<Payment> payments = [
    CreditCard(),
    JazzCash(),
    EasyPaisa(),
  ];

  for (var p in payments) {
    p.pay(500);
  }
}