class Library {
  // Private variables
  String _libraryName;
  List<String> _books;
  int _maxCapacity;

  // Constructor
  Library(this._libraryName, this._maxCapacity) : _books = [];

  // Getter for libraryName
  String get libraryName => _libraryName;

  // Setter for libraryName
  set libraryName(String newName) {
    if (newName.isNotEmpty) {
      _libraryName = newName;
    } else {
      print("Invalid library name.");
    }
  }

  // Getter for books
  // Copy return ho rahi hai, original list nahi
  List<String> get books => List.from(_books);

  // Getter for maxCapacity
  int get maxCapacity => _maxCapacity;

  // Computed getter
  int get totalBooks => _books.length;

  // Computed getter
  bool get isFull => _books.length >= _maxCapacity;

  // Add book method
  void addBook(String bookName) {
    if (isFull) {
      print("Library is full. Cannot add more books.");
    } else if (_books.contains(bookName)) {
      print("Book already exists in library.");
    } else {
      _books.add(bookName);

      print("Book added: $bookName");
      print("Total Books: $totalBooks");
    }
  }

  // Remove book method
  void removeBook(String bookName) {
    if (!_books.contains(bookName)) {
      print("Book not found in library.");
    } else {
      _books.remove(bookName);

      print("Book removed: $bookName");
      print("Total Books: $totalBooks");
    }
  }

  // Display method
  void display() {
    print("Library: $libraryName");
    print("Max Capacity: $maxCapacity");
    print("Total Books: $totalBooks");
    print("Is Full: $isFull");
    print("Books: $books");
  }
}

void main() {
  // Object create
  Library library = Library("City Library", 3);

  // Initial display
  library.display();

  print("");

  // Add books
  library.addBook("Dart Basics");

  print("");

  library.addBook("Flutter Guide");

  print("");

  // Duplicate book
  library.addBook("Dart Basics");

  print("");

  library.addBook("Python 101");

  print("");

  // Library full
  library.addBook("Java Basics");

  print("");

  // Display
  library.display();

  print("");

  // Remove existing book
  library.removeBook("Flutter Guide");

  print("");

  // Remove non-existing book
  library.removeBook("C++ Guide");

  print("");

  // Display
  library.display();

  print("");

  // Getter se copy lena
  var booksCopy = library.books;

  // Copy ko modify karna
  booksCopy.add("Hacked Book");

  // Original list par koi effect nahi hoga
  library.display();
}