l̥import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MoviesApi(),
  ));
}

class MoviesApi extends StatefulWidget {
  const MoviesApi({super.key});

  @override
  State<MoviesApi> createState() => _MoviesApiState();
}

class _MoviesApiState extends State<MoviesApi> {
  TextEditingController movieController = TextEditingController();
  Future<dynamic>? _futureData;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies API"),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                controller: movieController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter movie name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Movie",
                  hintText: "Search movie",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _futureData = _fetchData(movieController.text);
                  });
                }
              },
              child: const Text("Search"),
            ),
            Expanded(child: _showData()),
          ],
        ),
      ),
    );
  }

  Widget _showData() {
    return FutureBuilder(
      future: _futureData,
      builder: (context, snapshot) {
        if (_futureData == null) {
          return const Center(child: Text("Search a movie"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        final data = snapshot.data;

        return Card(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.network(
                data["Poster"] != "N/A"
                    ? data["Poster"]
                    : "https://via.placeholder.com/200",
                height: 200,
              ),
              const SizedBox(height: 10),
              Text(
                data["Title"],
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Year: ${data["Year"]}"),
              Text("IMDb Rating: ${data["imdbRating"]} ⭐"),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _fetchData(String movieName) async {
    final url = Uri.parse(
      "http://www.omdbapi.com/?apikey=b443b00b&t=$movieName",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
