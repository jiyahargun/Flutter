import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';
import 'package:teadiary/widget/drawer_dropdown.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  String? selectedSeller;
  String? selectedSellerId;

  List<Map<String, String>> sellerList = [];
  List<dynamic> sellerItems = [];

  List<int> quantities = [];
  List<bool> selectedItems = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSellers();
  }

  Future<void> fetchSellers() async {
    var url = Uri.parse("https://prakrutitech.xyz/jiya/seller_view.php");
    var resp = await http.get(url);

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      sellerList = List<Map<String, String>>.from(
        data.map(
          (e) => {
            "id": e['id'].toString(),
            "name": e['seller_name'].toString(),
          },
        ),
      );
    }
    setState(() => isLoading = false);
  }

  Future<void> fetchItems(String sellerId) async {
    setState(() {
      isLoading = true;
      sellerItems.clear();
    });

    var url = Uri.parse(
      "https://prakrutitech.xyz/jiya/item_view_sellerwise.php",
    );
    var resp = await http.post(url, body: {'seller_id': sellerId});

    if (resp.statusCode == 200) {
      sellerItems = jsonDecode(resp.body);
      quantities = List<int>.filled(sellerItems.length, 1);
      selectedItems = List<bool>.filled(sellerItems.length, false);
    }

    setState(() => isLoading = false);
  }

  double get grandTotal {
    double total = 0;
    for (int i = 0; i < sellerItems.length; i++) {
      if (selectedItems[i]) {
        double price =
            double.tryParse(sellerItems[i]['item_price'].toString()) ?? 0;
        total += price * quantities[i];
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: Text(
          "New Order",
          style: TextStyle(color: CustomColors.whiteColor),
        ),
        centerTitle: false,
        showLeading: false,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // SELLER DROPDOWN
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AppDropdown<String>(
                    hintText: "Select Seller",
                    labelText: "Seller Name",
                    value: selectedSeller,
                    items: sellerList
                        .map(
                          (e) => DropdownMenuItem(
                            value: e['name'],
                            child: Text(e['name'] ?? ''),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedSeller = val;
                        selectedSellerId = sellerList.firstWhere(
                          (e) => e['name'] == val,
                        )['id'];
                      });
                      fetchItems(selectedSellerId!);
                    },
                  ),
                ),

                // ITEMS LIST
                Expanded(
                  child: sellerItems.isEmpty
                      ? const Center(child: Text("Select seller to view items"))
                      : ListView.builder(
                          itemCount: sellerItems.length,
                          itemBuilder: (context, index) {
                            final item = sellerItems[index];
                            final double price =
                                double.tryParse(
                                  item['item_price'].toString(),
                                ) ??
                                0;

                            return Card(
                              margin: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              child: CheckboxListTile(
                                value: selectedItems[index],
                                onChanged: (val) {
                                  setState(() {
                                    selectedItems[index] = val!;
                                  });
                                },
                                title: Text(item['item_name']),
                                subtitle: Text("₹ $price"),
                                secondary: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        if (quantities[index] > 1) {
                                          setState(() {
                                            quantities[index]--;
                                          });
                                        }
                                      },
                                    ),
                                    Text("${quantities[index]}"),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          quantities[index]++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ₹${grandTotal.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primaryColor,
                        ),
                        onPressed: placeOrder,
                        child: const Text(
                          "Place Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> placeOrder() async {
    if (selectedSellerId == null) return;

    List<Map<String, dynamic>> items = [];

    for (int i = 0; i < sellerItems.length; i++) {
      if (selectedItems[i]) {
        items.add({
          "item_id": sellerItems[i]['item_id'],
          "quantity": quantities[i],
          "price": sellerItems[i]['item_price'],
        });
      }
    }

    if (items.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select items")));
      return;
    }

    final url = Uri.parse("https://prakrutitech.xyz/jiya/order_place.php");

    final body = {
      "seller_id": selectedSellerId,
      "total_amount": grandTotal,
      "items": items,
    };

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    print("ORDER RESPONSE => ${response.body}");

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order Placed Successfully")),
      );
      Navigator.pop(context);
    }
  }
}
