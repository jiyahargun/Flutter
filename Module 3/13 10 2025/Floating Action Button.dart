import 'package:flutter/material.dart';
void main ()
{
  runApp(MaterialApp(home: Actionbutt(),debugShowCheckedModeBanner: false,));
}

class Actionbutt extends StatefulWidget {
  const Actionbutt({super.key});

  @override
  State<Actionbutt> createState() => _ActionbuttState();
}

class _ActionbuttState extends State<Actionbutt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Floating Action Button ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),),
      body: Center
        (
        child: ListView
          (

          children:
          [

            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text("jiya",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print("clicked");
      },
        child: Icon(Icons.add),
      ),
    );
  }
}
