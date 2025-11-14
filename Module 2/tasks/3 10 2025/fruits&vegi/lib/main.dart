import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Option AlertDialog")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final Product? prodName = await _asyncSimpleDialog(context);
                if (prodName != null) {
                  print("Selected Fruit is $prodName");
                }
              },
              child: const Text("Fruits", style: TextStyle(fontSize: 20.0)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final Vegetable? vegName = await _asyncVegetableDialog(context);
                if (vegName != null) {
                  print("Selected Vegetable is $vegName");
                }
              },
              child: const Text("Vegetables", style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}

enum Product { Apple, Grapes, Orange, Mango, Kiwi }

_asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Product>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Fruit'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Apple);
            },
            child: const Text('Apple'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Grapes);
            },
            child: const Text('Grapes'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Orange);
            },
            child: const Text('Orange'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Mango);
            },
            child: const Text('Mango'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Kiwi);
            },
            child: const Text('Kiwi'),
          ),
        ],
      );
    },
  );
}

enum Vegetable { Carrot, Tomato, Brinjal, Lemon, Ginger }

_asyncVegetableDialog(BuildContext context) async {
  return await showDialog<Vegetable>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Vegetable'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Vegetable.Carrot);
            },
            child: const Text('Carrot'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Vegetable.Tomato);
            },
            child: const Text('Tomato'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Vegetable.Brinjal);
            },
            child: const Text('Brinjal'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Vegetable.Lemon);
            },
            child: const Text('Lemon'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Vegetable.Ginger);
            },
            child: const Text('Ginger'),
          ),
        ],
      );
    },
  );
}
