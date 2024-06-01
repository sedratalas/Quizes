import 'package:intl/intl.dart';

mixin DateFormatMixin {
  String formatDateToUTC(DateTime date) {
    return DateFormat('d-MMM, yyyy').format(date.toUtc());
  }
  String formatDateFromUTC(String utcDateString) {
    DateTime utcDate = DateTime.parse(utcDateString);
    DateTime localDate = utcDate.toLocal();
    return DateFormat('d-MMM, yyyy').format(localDate);
  }
}