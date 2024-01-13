import 'package:flutter/material.dart';
import 'result_screen.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  double bodyTemperature = 0;
  List<String> symptoms = [];
  int heartRate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/consult.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 50),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  bodyTemperature = double.parse(value);
                });
              },
              decoration:
                  const InputDecoration(labelText: 'Body Temperature (°C)'),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  symptoms = value.split(',').map((e) => e.trim()).toList();
                });
              },
              decoration: const InputDecoration(
                  labelText: 'Symptoms (comma-separated)'),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  heartRate = int.parse(value);
                });
              },
              decoration: const InputDecoration(labelText: 'Heart Rate (bpm)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bodyTemperature: bodyTemperature,
                      symptoms: symptoms,
                      heartRate: heartRate,
                    ),
                  ),
                );
              },
              child: const Text('Get Diagnosis'),
            ),
          ],
        ),
      ),
    );
  }
}
