import 'package:flutter/material.dart';

void main() {
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
     appBar: AppBar(title: Text("Home Screen"),backgroundColor: Colors.tealAccent,centerTitle: true,),
     body: SingleChildScrollView
       (
       child: Center
         (
         child: Column
           (
           children:
           [
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
             width: 200,
             height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             SizedBox(height: 10.00),
             Text("Likes : "),
             SizedBox(height: 20.00),
             Image.network("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
               width: 200,
               height: 200,
             ),
             ElevatedButton(
                 onPressed: () {
                   print("clicked");
                 }, child: Text("Submit")
             ),
             SizedBox(height: 20),
             Container
               (
               child: Padding
                 (padding: EdgeInsets.all(16.00),
                 child: Row
                   (
                   children:
                   [
                     CircleAvatar
                       (
                        radius: 80,
                       backgroundImage: NetworkImage("https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg"),
                     ),
                     SizedBox(height: 16,width: 16,),
                     Column
                       (
                       children:
                       [
                         Text("jiyahargun",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                         Text("Flutter Developer",style: TextStyle(color: Colors.grey)),
                       ],
                     )
                   ],
                 ),
               ),

             )
           ],
         ),
       ),
     ),
   );
  }
}
