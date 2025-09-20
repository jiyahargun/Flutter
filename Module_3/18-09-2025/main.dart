import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
       appBar: AppBar(title: Text("My First App"),backgroundColor: Colors.blueGrey,),
      body: Center
        (
          child: Column
            (
            children:
            <Widget>[
             SizedBox(height: 15,),
              Text("Flutter",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
              SizedBox(height: 15,),
              Text("PHP",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
              SizedBox(height: 15,),
              Text("Cyber Security",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
              SizedBox(height: 15,),
              Text("Oracle",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
              SizedBox(height: 15,),
              Text("java",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
              SizedBox(height: 15,),
              Text("IOS",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
              SizedBox(height: 15,),
              Text("Digital Marketing",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.black87),),
            ],
          ),
      ),
      );
  }


  }

