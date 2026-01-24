import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teadiary/colors/colors.dart';
import 'package:teadiary/widget/appbar.dart';
import 'package:teadiary/widget/text_filed.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isEdit = false;
  String? sellerId;

  late Future<List<dynamic>> sellerListFuture;

  @override
  void initState() {
    super.initState();
    sellerListFuture = fetchSeller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        titleWidget: const Text(
          "Seller List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        showLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              isEdit = false;
              nameController.clear();
              mobileController.clear();
              addressController.clear();
              openDialog();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: sellerListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(CustomColors.primaryColor),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No sellers found"));
          }

          final sellers = snapshot.data!;

          return ListView.builder(
            itemCount: sellers.length,
            itemBuilder: (context, index) {
              final seller = sellers[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Icon(Icons.person, color: CustomColors.primaryColor),
                  title: Text(seller["seller_name"]),
                  subtitle: Text(seller["contact"]),
                  onTap: () {
                    isEdit = true;
                    sellerId = seller["id"];
                    nameController.text = seller["seller_name"];
                    mobileController.text = seller["contact"];
                    addressController.text = seller["address"];
                    openDialog();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isEdit ? "Edit Seller" : "Add Seller"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: nameController,
              hintText: "Seller Name",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: mobileController,
              hintText: "Mobile",
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: addressController,
              hintText: "Address",
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
        actions: [
          if (isEdit)
            TextButton(
              onPressed: () async {
                await deleteSeller();
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          TextButton(
            onPressed: () async {
              if (isEdit) {
                await updateSeller();
              } else {
                await addSeller();
              }
              Navigator.pop(context);
            },
            child: Text(isEdit ? "Update" : "Save"),
          ),
        ],
      ),
    );
  }

  Future<List<dynamic>> fetchSeller() async {
    final url = Uri.parse("https://prakrutitech.xyz/jiya/seller_view.php");
    final res = await http.get(url);
    return jsonDecode(res.body);
  }

  Future<void> addSeller() async {
    final url = Uri.parse("https://prakrutitech.xyz/jiya/seller_insert.php");

    await http.post(
      url,
      body: {
        "seller_name": nameController.text,
        "contact": mobileController.text,
        "address": addressController.text,
      },
    );

    setState(() {
      sellerListFuture = fetchSeller();
    });
  }

  Future<void> updateSeller() async {
    final url = Uri.parse("https://prakrutitech.xyz/jiya/seller_update.php");

    await http.post(
      url,
      body: {
        "id": sellerId,
        "seller_name": nameController.text,
        "contact": mobileController.text,
        "address": addressController.text,
      },
    );

    setState(() {
      sellerListFuture = fetchSeller();
    });
  }

  Future<void> deleteSeller() async {
    final url = Uri.parse("https://prakrutitech.xyz/jiya/seller_delete.php");

    await http.post(url, body: {"id": sellerId});

    setState(() {
      sellerListFuture = fetchSeller();
    });
  }
}
