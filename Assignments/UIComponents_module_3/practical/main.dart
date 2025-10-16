import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: HorizontalProducts(), debugShowCheckedModeBanner: false),
  );
}

class HorizontalProducts extends StatefulWidget {
  const HorizontalProducts({super.key});

  @override
  State<HorizontalProducts> createState() => _HorizontalProductsState();
}

class _HorizontalProductsState extends State<HorizontalProducts> {
  List productsName = ["Kurti", "Purse", "Bag", "Shoes", "Heels", "Makeup"];

  List productsImg = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMktstAglhU30l4xlbdqIHhnuDE1qzjiUBrw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNtlzhrZi2HSlF8-6SM_PcGnsdJwhWY72GPA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsgIWoao3emtam6hPgyufqCQa0RFkDMpb47A&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSac3ZdJ8aUOaEnsec0w-qiYGass_Hb9sPGaQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK0VBhsup3v5m31yCk5QSSCfd2KBB8Srub0A&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1lz6kj7xo7KoKz9kusJ_cAGlGWX5_fe6KCQ&s',
  ];

  List productsPrice = [
    'Rs. 300',
    'Rs. 100',
    'Rs. 300',
    'Rs. 500',
    'Rs. 1300',
    'Rs. 3200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsName.length,
            itemBuilder: (context, index) {
              return productCard(
                productsImg[index],
                productsName[index],
                productsPrice[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget productCard(String img, String name, String price) {
    return Container(
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              img,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 6),
          Text(
            price,
            style: TextStyle(color: Colors.green.shade700, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
