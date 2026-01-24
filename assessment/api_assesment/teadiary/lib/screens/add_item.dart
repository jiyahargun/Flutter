import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';
import 'package:teadiary/widget/text_filed.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String nameValue = "";
  String priceValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: Text("Add New Item"),
        centerTitle: false,
        showLeading: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white54,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Text("Name", style: TextStyle(fontSize: 16)),
                          ),
                          Text(" : "),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AppTextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              hintText: 'Enter item name',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter item name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Text(
                              "Price",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(" : "),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AppTextField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              hintText: 'Enter item price',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter price';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Enter a valid number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: CustomColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  nameValue = nameController.text.trim();
                  priceValue = priceController.text.trim();

                  bool success = await _insertItem(nameValue, priceValue);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? "Item added successfully!"
                            : "Failed to add item.",
                      ),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );

                  if (success) {
                    Navigator.pop(context, true);
                  }
                }
              },
              child: Text(
                "Add Item",
                style: TextStyle(color: CustomColors.whiteColor, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<bool> _insertItem(String name, String price) async {
    var url = Uri.parse("https://prakrutitech.xyz/jiya/item_insert.php");

    try {
      var resp = await http.post(
        url,
        body: {"item_name": name, "item_price": price},
      );

      print("Item Inserted: $name, $price");
      print("Response: ${resp.body}");

      return resp.statusCode == 200;
    } catch (e) {
      print("Error inserting item: $e");
      return false;
    }
  }
}
