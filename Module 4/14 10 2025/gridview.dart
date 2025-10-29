import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Gridviewex(), debugShowCheckedModeBanner: false));
}

class Gridviewex extends StatefulWidget {
  const Gridviewex({super.key});

  @override
  State<Gridviewex> createState() => _GridviewexState();
}

class _GridviewexState extends State<Gridviewex> {
  List tech = [
    "Panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "Panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
    "panda",
  ];
  List teching = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXt36v4tvJArrh22XC3bUqFnKSikrIqoQ0Pg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVewj1rOxjIAqzic0-JwX8fBB0mMl_yEa7dw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY25HGKcXHDwAFtlkG7Dn5njaj4b-355OJUA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHIe_P4Y9Pj1-tHfsLrLC43ZTJleDYTrXvcQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDpct7xoXZ4AC60tJ_GbUZp0Rcw41CPT7sUQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuD_fSJBYlFvEhQgTh8mqpiMT96_hbu07V8A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlLh-I9wt_n68U_QLuiSfs8AJuQTMt93ShiQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQocPjEtUrtrIKuUwC8BH_egqRXOIwBMegWFA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOZfjQqTKl9ZCZFkEnYWDt3XvUT1sOV97KHQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXt36v4tvJArrh22XC3bUqFnKSikrIqoQ0Pg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVewj1rOxjIAqzic0-JwX8fBB0mMl_yEa7dw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY25HGKcXHDwAFtlkG7Dn5njaj4b-355OJUA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHIe_P4Y9Pj1-tHfsLrLC43ZTJleDYTrXvcQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDpct7xoXZ4AC60tJ_GbUZp0Rcw41CPT7sUQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuD_fSJBYlFvEhQgTh8mqpiMT96_hbu07V8A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlLh-I9wt_n68U_QLuiSfs8AJuQTMt93ShiQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQocPjEtUrtrIKuUwC8BH_egqRXOIwBMegWFA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOZfjQqTKl9ZCZFkEnYWDt3XvUT1sOV97KHQ&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: tech.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(
              child: Column(
                children: [
                  Image.network(teching[index], width: 350, height: 250),
                  Text(tech[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
