import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: ShoppingCartApp(), debugShowCheckedModeBanner: false),
  );
}

class ShoppingCartApp extends StatefulWidget {
  @override
  _ShoppingCartAppState createState() => _ShoppingCartAppState();
}

class _ShoppingCartAppState extends State<ShoppingCartApp> {
  int cartCount = 0;

  List items = [
    "vivo",
    "i phone",
    "redmi",
    "realme",
    "oppo",
    "samsung",
    "Motorola",
    "OnePlus",
    "pixel",
    "nokia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart', style: TextStyle(fontSize: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.shopping_cart, size: 24),
                SizedBox(width: 5),
                Text('$cartCount', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(items[index], style: TextStyle(fontSize: 18)),
                  ElevatedButton(
                    child: Text('Add to Cart'),
                    onPressed: () {
                      setState(() {
                        cartCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
