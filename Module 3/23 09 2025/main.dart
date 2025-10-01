import 'package:f3/secondscreen.dart';
import 'package:f3/thirdscreen.dart';
import 'package:flutter/material.dart';
import 'firstscreen.dart';
import 'fourthscreen.dart';

void main()
{
  runApp(MaterialApp(home: FirstScreen(),debugShowCheckedModeBanner: false,));
}
class FirstScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Profile Screen"),),
      body: Column
        (
        children:
        [
          FirstScreen1(),
          SizedBox(height: 20,),
          SecondScreen(),
          SizedBox(height: 20,),
          ThirdScreen(),
          SizedBox(height: 20,),
          Fourthscreen()


        ],
      ),

    );
  }

}