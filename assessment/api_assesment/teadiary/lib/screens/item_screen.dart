import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/screens/add_item.dart';
import 'package:teadiary/screens/edit_items.dart';
import 'package:teadiary/widget/appbar.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List<dynamic> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    setState(() => isLoading = true);
    var url = Uri.parse("https://prakrutitech.xyz/jiya/item_view.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      items = jsonDecode(response.body);
    }
    setState(() => isLoading = false);
  }

  Future<void> deleteItem(String id) async {
    var url = Uri.parse("https://prakrutitech.xyz/jiya/item_delete.php");
    var resp = await http.post(url, body: {"item_id": id});
    if (resp.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Item deleted successfully")));
      fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: Text(
          "Items",
          style: TextStyle(color: CustomColors.whiteColor),
        ),
        centerTitle: false,
        showLeading: false,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primaryColor,
        child: Icon(Icons.add, color: CustomColors.whiteColor),
        onPressed: () async {
          bool? added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddItemScreen()),
          );
          if (added == true) fetchItems();
        },
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: ListTile(
                    title: Text(item['item_name']),
                    subtitle: Text("₹ ${item['item_price']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.green),
                          onPressed: () async {
                            bool? updated = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditItemScreen(
                                  itemId: item['id'],
                                  itemName: item['item_name'],
                                  itemPrice: item['item_price'],
                                ),
                              ),
                            );
                            if (updated == true) fetchItems();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteItem(item['id']),
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
