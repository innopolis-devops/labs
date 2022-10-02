import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';

class MoscowTime {
  static final moscowLocation = getLocation('Europe/Moscow');

  static TZDateTime get moscowTime => TZDateTime.now(moscowLocation);

  static String get moscowTimeFormatted =>
      DateFormat('dd.MM.yyyy hh:mm:ss').format(moscowTime);
}
