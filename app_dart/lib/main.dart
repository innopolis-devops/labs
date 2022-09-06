import 'package:app_dart/app.dart';
import 'package:flutter/material.dart';
import 'package:timezone/browser.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initTimeZoneDB();
  runApp(const App());
}

Future<void> initTimeZoneDB() async {
  await tz.initializeTimeZone();
}
