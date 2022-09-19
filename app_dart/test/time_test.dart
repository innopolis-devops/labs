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
      await tester.pump(const Duration(milliseconds: 600));
      final now = tz.TZDateTime.now(zone);
      final range = DateTimeRange(
        start: now.subtract(const Duration(milliseconds: 1100)),
        end: now.add(const Duration(milliseconds: 1100)),
      );
      final time = find.byType(Text).at(1).evaluate().first.widget;
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.text('Current Time in Europe/Moscow'), findsOneWidget);
      if (time is Text) {
        final string = time.data!.split(':');
        final dataToCompare = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(string[0]),
          int.parse(string[1]),
          int.parse(string[2]),
          now.millisecond,
        );
        expect(
          dataToCompare.isAfter(range.start) &&
              dataToCompare.isBefore(range.end),
          true,
        );
      }
    },
  );
}
