import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Details Screen",style: TextStyle(fontWeight: FontWeight.bold),),),
      body: Center
        (
        child: Column
          (
          children:
          [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIMgndqDLqHSpzAvgD1CYtWgyI8i83Vh3UWQ&s"),
            Text("Headphone",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Price 300",style: TextStyle(fontWeight: FontWeight.bold),),

            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIMgndqDLqHSpzAvgD1CYtWgyI8i83Vh3UWQ&s"),
            Text("Headphone",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Price 300",style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
