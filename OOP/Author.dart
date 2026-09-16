class Book {
  String title = "";
  String author = "";
  double price = 0.0;
}

void main() {
  Book b1 = Book();
  b1.title = "The Alchemist";
  b1.author = "Paulo Coelho";
  b1.price = 12.99;

  print("Title: ${b1.title}");
  print("Author: ${b1.author}");
  print("Price: ${b1.price}");
}
