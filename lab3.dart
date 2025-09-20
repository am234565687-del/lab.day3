//Ass1
class Car {
  String brand;
  int year;

  Car(this.brand, this.year);

  Car.toyota(this.year) : brand = "Toyota"; 

  const Car.constant(this.brand, this.year); 

  void displayInfo() {
    print("Car Brand: $brand, Year: $year");
  }
}
class BankAccount {
  double _balance = 0;

  double get balance => _balance;
  set deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount");
    } else {
      print("Invalid deposit amount!");
    }
  }
  set withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: $amount");
    } else {
      print("Invalid withdraw amount!");
    }
  }
}void main() {
  print("----- 1. Class vs Object -----");
  Car car1 = Car("BMW", 2022);
  Car car2 = Car.toyota(2023); 
  car1.displayInfo();
  car2.displayInfo();

  print("\n----- 2. Constructors -----");
  const Car car3 = Car.constant("Honda", 2020);
  car3.displayInfo();

  print("\n----- 3. Access Modifiers -----");
  print("Public access example: ${car1.brand}");

  print("\n----- 4. Encapsulation (Getter & Setter) -----");
  BankAccount account = BankAccount();
  account.deposit = 500; 
  account.withdraw = 200;
  print("Current Balance: ${account.balance}"); 

  print("\n----- 5. Why Setter is better than Public variable -----");
  account.deposit = -100;
}
//Ass2
class BankAccount {
  double _balance = 0;

  double get balance => _balance;
  set deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount");
    } else {
      print("Invalid deposit amount!");
    }
  }
}

void main() {
  BankAccount account = BankAccount();

  account.deposit = 500;   
  print("Balance: ${account.balance}");

  account.deposit = -100; 
  print("Balance: ${account.balance}");
}
//Ass3
class User {
  String _username = "";
  set username(String value) {
    if (value.isNotEmpty) {
      _username = value;
      print("Username set to: $_username");
    } else {
      print("Invalid username! It cannot be empty.");
    }
  }
  String get username => _username;
}

void main() {
  User user = User();

  user.username = "Aya";
  print("Current username: ${user.username}");

  user.username = "";   
  print("Current username: ${user.username}");
}*/
//Ass4
class Product {
  int _id = 0;
  String _name = "";
  double _price = 0;

  Product(this._id, this._name, this._price) {
    if (_price <= 0) {
      throw Exception("Price must be greater than 0");
    }
  }

  int get id => _id;
  String get name => _name;
  double get price => _price;

  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    } else {
      print("Invalid name!");
    }
  }

  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("Invalid price! Must be > 0");
    }
  }

  @override
  String toString() {
    return "ID: $_id | Name: $_name | Price: \$$_price";
  }
}

class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    print("${product.name} added to cart.");
  }

  void removeProduct(Product product) {
    if (products.remove(product)) {
      print("${product.name} removed from cart.");
    } else {
      print("${product.name} not found in cart.");
    }
  }

  void showCart() {
    if (products.isEmpty) {
      print("Cart is empty.");
    } else {
      print("----- Cart Items -----");
      for (var p in products) {
        print(p);
      }
      double total = products.fold(0, (sum, p) => sum + p.price);
      print("Total: \$$total");
    }
  }
}

void main() {
  Product p1 = Product(1, "Laptop", 1500);
  Product p2 = Product(2, "Phone", 800);
  Product p3 = Product(3, "Headphones", 200);


  Cart cart = Cart();
  cart.addProduct(p1);
  cart.addProduct(p2);

  cart.showCart();
}
