import 'package:intl/intl.dart';

extension DateExtensions on int {
  String toFormattedString({String format = 'yyyy-MM-dd HH:mm:ss'}) {
    var date = DateTime.fromMillisecondsSinceEpoch(this);
    var formatter = DateFormat(format);
    return formatter.format(date);
  }

  String toShortDateString() => toFormattedString(format: 'dd-MM-yyyy');

  String toLongDateString() => toFormattedString(format: 'MMMM dd, yyyy');

  String toTimeString() => toFormattedString(format: 'HH:mm:ss');

  String toDateTimeString() => toFormattedString();
}
