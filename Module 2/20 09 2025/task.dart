import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: Center(
        child: Column(
          children: [
            Container(child: Padding(padding: EdgeInsets.all(8.0))),

            Container(
              color: Colors.blue.shade100,
              padding: EdgeInsets.all(11.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEDGqtaLkwxCTOSdnwSuDQKqx_PpZu6kHygw&s",
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "likes",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                print("Like");
              },
              child: Text("Like"),
            ),
            Text("current mood", style: TextStyle(fontSize: 25)),
            Text("😊 Happy"),
            ElevatedButton(
              onPressed: () {
                print("Mood");
              },
              child: Text("Change Mood"),
            ),
            SizedBox(height: 20, width: 15),
            Text(
              "Powered By Flutter",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
