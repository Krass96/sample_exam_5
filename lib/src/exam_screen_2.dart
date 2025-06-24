import 'dart:math';

import 'package:flutter/material.dart';

class ExamScreen2 extends StatefulWidget {
  const ExamScreen2({super.key});

  @override
  State<ExamScreen2> createState() => _ExamScreen2State();
}

class _ExamScreen2State extends State<ExamScreen2> {
  int? _temperature;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futures - Async Await'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                FilledButton(
                  onPressed: () async {
                    String city = await _getUserCity();
                    int temperature = await _getCurrentTemp(city);
                    setState(() {
                      _temperature = temperature;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Temperatur für $city abgerufen'),
                    ));
                  },
                  child: Text('Temperatur abrufen'),
                ),
                SizedBox(height: 16),
                Text(
                  'Temperatur: ${_temperature ?? '---'}°C',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Simulates a weather API call
  /// after 1 second the current temperature of the city is returned
  /// the temperature is between 10 and 30
  Future<int> _getCurrentTemp(String city) async {
    await Future.delayed(Duration(seconds: 1));
    return Random().nextInt(20) + 10;
  }

  /// Simulates a user API call
  /// after 1 second the city of the user is returned
  Future<String> _getUserCity() async {
    await Future.delayed(Duration(seconds: 1));
    int random = Random().nextInt(2);
    if (random == 0) {
      return 'Berlin';
    } else {
      return 'München';
    }
  }
}
