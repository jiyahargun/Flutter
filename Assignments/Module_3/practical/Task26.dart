import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: EasyList(), debugShowCheckedModeBanner: false));
}

class EasyList extends StatefulWidget {
  @override
  _EasyListState createState() => _EasyListState();
}

class _EasyListState extends State<EasyList> {
  List<int> items = List.generate(20, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Easy Infinite List")),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            Future.delayed(Duration(seconds: 1), () {
              setState(() {
                items.addAll(List.generate(20, (i) => items.length + i));
              });
            });
            return Center(child: CircularProgressIndicator());
          }
          return ListTile(title: Text("Item ${items[index]}"));
        },
      ),
    );
  }
}
