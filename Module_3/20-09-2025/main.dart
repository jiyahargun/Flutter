
import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false));
  //runApp(MyApp());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.network(
                "https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
                width: 200,
                height: 200,
              ),
              Text("Likes : "),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Image.network(
                "https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
                width: 200,
                height: 200,
              ),
              Text("Likes : "),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Image.network(
                "https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
                width: 200,
                height: 200,
              ),
              Text("Likes : "),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Image.network(
                "https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
                width: 200,
                height: 200,
              ),
              Text("Likes : "),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Image.network(
                "https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",
                width: 200,
                height: 200,
              ),
              Text("Likes : "),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("clicked");
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 20),


              Container
                (
                child: Padding
                  (
                  padding: EdgeInsets.all(16.00),
                  child: Text("Tops Technologies",style: TextStyle(fontSize: 20.00),),

                ),

              ),
              Container
                (
                color: Colors.blue.shade50,
                padding: EdgeInsets.all(16.0),
                child: Row
                  (
                  children:
                  [
                    CircleAvatar
                      (
                      radius: 80,
                      backgroundImage: NetworkImage( "https://m.media-amazon.com/images/I/51P1d8NAG4L._UF1000,1000_QL80_.jpg",), // Add your image
                    ),
                    SizedBox(height: 16,width: 16,),
                    Column
                      (
                      children:
                      [
                        Text('Jiya hargun', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Flutter Developer', style: TextStyle(color: Colors.grey)),

                      ],
                    )

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
