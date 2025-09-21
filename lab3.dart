//Ass1
/*class BankAccount {
  double _balance = 0;
  double get balance => _balance;
  set deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: \$${amount}, New Balance: \$${_balance}");
    } else {
      print("Invalid amount. Deposit must be greater than 0.");
    }
  }
}

void main() {
  BankAccount account = BankAccount();

  print("Initial Balance: \$${account.balance}");

  account.deposit = 100;
  account.deposit = -50; 
  account.deposit = 200; 

  print("Final Balance: \$${account.balance}");
}

//Ass2

class User {
  String _username = "";
  set username(String value) {
    if (value.trim().isNotEmpty) {
      _username = value;
      print("Username set successfully: $_username");
    } else {
      print("Invalid username. It cannot be empty.");
    }
  }
  String get username => _username;
}

void main() {
  User user = User();

  user.username = "";       
  user.username = "  ";     
  user.username = "Aya123"; 

  print("Final Username: ${user.username}");
}*/

//Ass3

class Product {
  int _id;
  String _name;
  double _price;
  Product(this._id, this._name, double price)
      : _price = (price > 0 ? price : 0);
  int get id => _id;
  String get name => _name;
  double get price => _price;
  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("Invalid price. Must be greater than 0.");
    }
  }

  @override
  String toString() {
    return "Product(ID: $_id, Name: $_name, Price: \$$_price)";
  }
}

class Cart {
  List<Product> products = [];
  void addProduct(Product product) {
    products.add(product);
    print("${product.name} added to cart.");
  }

  void removeProduct(int id) {
    products.removeWhere((p) => p.id == id);
    print("Product with ID $id removed from cart.");
  }

  void showCart() {
    if (products.isEmpty) {
      print("Cart is empty.");
    } else {
      print("\n🛒 Cart Contents:");
      double total = 0;
      for (var p in products) {
        print("- ${p.name} (\$${p.price})");
        total += p.price;
      }
      print("Total Price: \$${total}");
    }
  }
}

void main() {
  Product p1 = Product(1, "Laptop", 1200);
  Product p2 = Product(2, "Phone", 800);
  Product p3 = Product(3, "Headphones", 150);
  Cart cart = Cart();
  cart.addProduct(p1);
  cart.addProduct(p3);
  cart.showCart();
  cart.removeProduct(1);
  cart.showCart();
}
