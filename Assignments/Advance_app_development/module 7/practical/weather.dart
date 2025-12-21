import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: WeatherApp()));
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherInfo = "";

  Future<void> fetchWeather(String city) async {
    try {
      var geoUrl = 'https://geocoding-api.open-meteo.com/v1/search?name=$city';
      var geoRes = await http.get(Uri.parse(geoUrl));
      var geoData = jsonDecode(geoRes.body);

      if (geoData['results'] != null && geoData['results'].isNotEmpty) {
        var lat = geoData['results'][0]['latitude'];
        var lon = geoData['results'][0]['longitude'];

        var weatherUrl =
            'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true&timezone=auto';
        var weatherRes = await http.get(Uri.parse(weatherUrl));
        var weatherData = jsonDecode(weatherRes.body);

        var current = weatherData['current_weather'];
        setState(() {
          _weatherInfo =
              "City: $city\n"
              "Latitude: $lat\n"
              "Longitude: $lon\n"
              "Temperature: ${current['temperature']}°C\n"
              "Wind Speed: ${current['windspeed']} km/h\n"
              "Wind Direction: ${current['winddirection']}°\n"
              "Time: ${current['time']}";
        });
      } else {
        setState(() {
          _weatherInfo = "City not found";
        });
      }
    } catch (e) {
      setState(() {
        _weatherInfo = "Error fetching weather";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Weather App"),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                prefixIcon: Icon(Icons.location_city),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () {
                fetchWeather(_cityController.text);
              },
              icon: Icon(Icons.cloud),
              label: Text("Get Weather"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 25),

            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _weatherInfo.isEmpty
                          ? "Enter a city to see weather details"
                          : _weatherInfo,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
