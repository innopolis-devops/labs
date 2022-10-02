import 'package:app_dart/application/application.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Current Time in Moscow: ${MoscowTime.moscowTimeFormatted}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
