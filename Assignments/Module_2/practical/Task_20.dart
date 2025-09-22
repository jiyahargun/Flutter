import 'dart:io';

class Product
{
  String name;
  double price;

  Product(this.name, this.price)
  {
    print("$name");
    print("$price");
  }
}

class Cart
{
  List<Product> items = [];

  void addProduct(Product product)
  {
    items.add(product);
    print("${product.name} added to cart.");
    print("Total = ₹${calculateTotal()}");
  }

  calculateTotal()
  {
    double total = 0;
    for (var item in items)
    {
      total += item.price;

    }
    return total;
  }
}

class Order
{
  placeOrder(Cart cart)
  {
    if (cart.items.isEmpty)
    {
      print("Cart is empty. Please add products first.");
      return;
    }
    print("Products in Cart:");
    for (var product in cart.items)
    {
      print("${product.name} - ₹${product.price}");
    }
    print("Final Total Price: ₹${cart.calculateTotal()}");
  }
}

void main()
{
  int value=0;

  var productList = [
    Product("Laptop", 55000),
    Product("Phone", 20000),
    Product("Headphones", 3000),
    Product("Keyboard", 1500),
    Product("Mouse", 1200),
    Product("Monitor", 12000),
    Product("Printer", 8000),
    Product("Camera", 25000),
    Product("Charger", 800),
    Product("USB Cable", 500)
  ];

  Cart cart = Cart();
  Order order = Order();

  while(true)
  {
    print("========= MENU =========");
    print("1. Add Laptop");
    print("2. Add Phone");
    print("3. Add Headphones");
    print("4. Place Order");
    print("5. Exit");
    print("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync().toString());

    switch (choice)
    {
      case 1:
        cart.addProduct(productList[0]);
        break;
      case 2:
        cart.addProduct(productList[1]);
        break;
      case 3:
        cart.addProduct(productList[2]);
        break;
      case 4:
        order.placeOrder(cart);
        break;
      case 5: exit(0);
      break;

      default:
        print("Invalid choice! Please try again.");
    }
  }

}
