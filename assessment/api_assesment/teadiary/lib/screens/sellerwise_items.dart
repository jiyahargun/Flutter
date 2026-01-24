import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';
import 'package:teadiary/widget/drawer_dropdown.dart';

class SellerwiseItemScreen extends StatefulWidget {
  const SellerwiseItemScreen({super.key});

  @override
  State<SellerwiseItemScreen> createState() => _SellerwiseItemScreenState();
}

class _SellerwiseItemScreenState extends State<SellerwiseItemScreen> {
  String? selectedSeller;
  String? selectedSellerId;

  List<Map<String, String>> sellerList = [];
  List<dynamic> itemList = [];
  List<bool> selectedItems = [];

  bool isLoading = false;
  bool showItemError = false;

  @override
  void initState() {
    super.initState();
    fetchSellers();
    fetchAllItems();
  }

  // 🔹 FETCH SELLERS
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
    setState(() {});
  }

  // 🔹 FETCH ALL ITEMS
  Future<void> fetchAllItems() async {
    setState(() => isLoading = true);

    var url = Uri.parse("https://prakrutitech.xyz/jiya/item_view.php");
    var resp = await http.get(url);

    if (resp.statusCode == 200) {
      itemList = jsonDecode(resp.body);
      selectedItems = List<bool>.filled(itemList.length, false);
    }

    setState(() => isLoading = false);
  }

  // 🔹 SAVE SELECTED ITEMS SELLER WISE
  Future<void> saveSellerItems() async {
    if (selectedSellerId == null) return;

    bool anySelected = selectedItems.contains(true);
    if (!anySelected) {
      setState(() => showItemError = true);
      return;
    }

    for (int i = 0; i < itemList.length; i++) {
      if (selectedItems[i]) {
        await http.post(
          Uri.parse("https://prakrutitech.xyz/jiya/item_insert_sellerwise.php"),
          body: {
            "seller_id": selectedSellerId!,
            "item_name": itemList[i]['item_name'],
            "item_price": itemList[i]['item_price'],
          },
        );
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Items saved successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: Text(
          "Seller Items",
          style: TextStyle(color: CustomColors.whiteColor),
        ),
        centerTitle: false,
        showLeading: false,
      ),
      body: Column(
        children: [
          // 🔹 SELLER DROPDOWN
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
                  selectedSellerId =
                  sellerList.firstWhere((e) => e['name'] == val)['id'];
                });
              },
            ),
          ),

          // 🔹 ITEM LIST WITH CHECKBOX
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: CheckboxListTile(
                    value: selectedItems[index],
                    onChanged: (val) {
                      setState(() {
                        selectedItems[index] = val!;
                        showItemError = false;
                      });
                    },
                    title: Text(itemList[index]['item_name']),
                    subtitle:
                    Text("₹ ${itemList[index]['item_price']}"),
                    activeColor: CustomColors.primaryColor,
                  ),
                );
              },
            ),
          ),

          if (showItemError)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Please select at least one item",
                style: TextStyle(color: Colors.red),
              ),
            ),

          // 🔹 SAVE BUTTON
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primaryColor,
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: saveSellerItems,
              child: Text(
                "Save",
                style: TextStyle(color: CustomColors.whiteColor, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
