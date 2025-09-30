import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("My first App"),backgroundColor: Colors.grey,),
      body: Center
        (
        child: Column
          (
          children:
          [
            SizedBox(height: 10),
            Text("flutter",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10,),
            Text("Android",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("Linux",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("Python",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("java",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("IOS",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("oracle",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text(".net",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("Digital marketing",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10),
            Text("Graphics",style: TextStyle(fontSize: 25.00,color: Colors.black,fontWeight: FontWeight.bold,),),

          ],
        ),
      ),
    );
  }
}
