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
              decoration: InputDecoration(labelText: "Enter city name"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("Fetch Weather"),
            ),
            SizedBox(height: 20),
            Text("City: $cityName", style: TextStyle(fontSize: 20)),
            Text("Temperature: $temperature", style: TextStyle(fontSize: 20)),
            Text("Condition: $condition", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
