import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timezone/browser.dart' as tz;

final zoneProvider = Provider<tz.Location>((ref) {
  return tz.getLocation('Europe/Moscow');
});

final curentTimeProvider = Provider<AsyncValue<DateTime>>((ref) {
  final zone = ref.watch(zoneProvider);
  final time = ref.watch(tickProvider).whenData((value) {
    // return DateTime.now();
    return tz.TZDateTime.now(zone);
  });
  // ignore: avoid_print
  print('current time is $time');
  return time;
});

final tickProvider = StreamProvider<int>((ref) async* {
  yield* Stream.periodic(
    const Duration(milliseconds: 500),
    (data) => data,
  ).takeWhile((element) => true);
});
