import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String cityName = "Enter a city";
  String temperature = "--°C";
  String condition = "Unknown";
  List<Map<String, String>> forecastData = [];

  // Function to simulate fetching weather data
  void _fetchWeather() {
    setState(() {
      cityName = _cityController.text.isNotEmpty ? _cityController.text : "Unknown City";
      temperature = "${15 + Random().nextInt(16)}°C"; // Random temp between 15°C and 30°C
      condition = ["Sunny", "Cloudy", "Rainy"][Random().nextInt(3)]; // Random condition
    });
  }

  // Function to generate a random 7-day forecast
  List<Map<String, String>> _generateForecast() {
    List<Map<String, String>> forecast = [];
    for (int i = 1; i <= 7; i++) {
      forecast.add({
        "day": "Day $i",
        "temperature": "${15 + Random().nextInt(16)}°C",
        "condition": ["Sunny", "Cloudy", "Rainy"][Random().nextInt(3)]
      });
    }
    return forecast;
  }

  // Function to fetch and display the forecast
  void _fetchForecast() {
    setState(() {
      forecastData = _generateForecast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather Info")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: "Enter city name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text("Fetch Weather"),
            ),
            SizedBox(height: 20),
            Text("City: $cityName", style: TextStyle(fontSize: 20)),
            Text("Temperature: $temperature", style: TextStyle(fontSize: 20)),
            Text("Condition: $condition", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchForecast,
              child: Text("Fetch 7-Day Forecast"),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: forecastData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${forecastData[index]['day']}: ${forecastData[index]['temperature']}, ${forecastData[index]['condition']}",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
