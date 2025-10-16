import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: SearchBarExample(), debugShowCheckedModeBanner: false),
  );
}

class SearchBarExample extends StatefulWidget {
  const SearchBarExample({super.key});

  @override
  State<SearchBarExample> createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  TextEditingController _controller = TextEditingController();
  List allItems = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Pineapple",
    "Strawberry",
    "Watermelon",
    "Cherry",
  ];
  List filteredItems = [];

  @override
  initState() {
    super.initState();
    filteredItems = allItems;
    _controller.addListener(() {
      filterItems();
    });
  }

  filterItems() {
    String query = _controller.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredItems = allItems;
      } else {
        filteredItems = allItems
            .where((item) => item.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
                    onTap: () {
                      _controller.text = filteredItems[index];
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
