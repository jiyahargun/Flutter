import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custmized.dart';

void main() {
  runApp(
    MaterialApp(
      home: ShimmerEx(),
      routes: {'loading': (_) => LoadingListPage()},
      debugShowCheckedModeBanner: false,
    ),
  );
}
