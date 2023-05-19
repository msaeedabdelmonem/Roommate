import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  /// Returns date formatted using the supplied [format]
  /// the default format is like like 31/10/1990 MMMM dd, yyyy
  String readableDate({format = 'dd MMMM ,yyyy', String? locale}) {
    final DateFormat formatter = DateFormat(
      format,
      locale ?? 'ar',
    );
    final String formatted = formatter.format(this);
    return formatted;
  }
}
