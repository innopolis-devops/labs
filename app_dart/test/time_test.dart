import 'package:app_dart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/browser.dart' as tz;

void main() async {
  await tz.initializeTimeZone();
  final zone = tz.getLocation('Europe/Moscow');
  testWidgets(
    'time test',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
      final start =
          tz.TZDateTime.now(zone).subtract(const Duration(seconds: 2));
      await tester.pump(const Duration(milliseconds: 600));
      final end = tz.TZDateTime.now(zone).add(const Duration(seconds: 2));
      final time = find.byType(Text).at(1).evaluate().first.widget;
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.text('Current Time in Europe/Moscow'), findsOneWidget);
      if (time is Text) {
        final string = time.data!.split(':');
        final dataToCompare = DateTime(
          end.year,
          end.month,
          end.day,
          int.parse(string[0]),
          int.parse(string[1]),
          int.parse(string[2]),
        );
        debugPrint(start.toString());
        debugPrint(dataToCompare.toString());
        debugPrint(end.toString());
        debugPrint(dataToCompare.isAfter(start).toString());
        // debugPrint(dataToCompare.isBefore(end).toString());
        expect(
          dataToCompare.isAfter(start) /*&& dataToCompare.isBefore(end)*/,
          true,
        );
      }
    },
  );
}
