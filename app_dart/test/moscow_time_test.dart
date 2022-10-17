import 'package:app_dart/application/application.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart';

void main() {
  test('Time should be correct', () async {
    initializeTimeZones();
    var before = MoscowTime.moscowTimeFormatted;
    await Future.delayed(const Duration(seconds: 1));
    var after = MoscowTime.moscowTimeFormatted;

    var beforeSec = int.parse(before.split(':').last);
    var afterSec = int.parse(after.split(':').last);

    expect((beforeSec + 1) % 60, afterSec);
  });
}
