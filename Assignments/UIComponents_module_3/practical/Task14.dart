import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: SimpleGalleryApp(), debugShowCheckedModeBanner: false),
  );
}

class SimpleGalleryApp extends StatelessWidget {
  List imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5cAmvD4DWyFIDfRN9mpRKCjnwHAoHTD_YKA&s',
    'https://static.vecteezy.com/system/resources/thumbnails/032/698/906/small_2x/a-cute-panda-bear-enjoying-the-grassy-landscape-ai-generated-photo.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/032/698/906/small_2x/a-cute-panda-bear-enjoying-the-grassy-landscape-ai-generated-photo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrAN338UXcmfXAYFPIBvmd4NQWWPA98P2R1GLIn6eANJyOQ__PDQdVezi8DXUEStJnSfU&usqp=CAU',
    'https://static.vecteezy.com/system/resources/thumbnails/030/653/335/small_2x/panda-wallpapers-that-are-as-cool-as-your-phone-free-photo.jpg',
    'https://t4.ftcdn.net/jpg/10/41/19/37/360_F_1041193795_WnRH7nGoKgpnYK6mLPyliVkWN21uftWy.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5cAmvD4DWyFIDfRN9mpRKCjnwHAoHTD_YKA&s',
    'https://static.vecteezy.com/system/resources/thumbnails/032/698/906/small_2x/a-cute-panda-bear-enjoying-the-grassy-landscape-ai-generated-photo.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/032/698/906/small_2x/a-cute-panda-bear-enjoying-the-grassy-landscape-ai-generated-photo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrAN338UXcmfXAYFPIBvmd4NQWWPA98P2R1GLIn6eANJyOQ__PDQdVezi8DXUEStJnSfU&usqp=CAU',
    'https://static.vecteezy.com/system/resources/thumbnails/030/653/335/small_2x/panda-wallpapers-that-are-as-cool-as-your-phone-free-photo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYbDUhFuC0GtAd8v6cXRYdY3Utwd7u-DoSI2rn6FVd7slI2VioyhoH3pdR8pr_UKzyQI8&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Photo Gallery'), centerTitle: true),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        children: imageUrls.map((url) {
          return Image.network(url, fit: BoxFit.cover);
        }).toList(),
      ),
    );
  }
}
