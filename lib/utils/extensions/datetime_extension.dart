import 'package:intl/intl.dart';

String dateForm = 'dd/MM/yyyy';
String timeForm = 'h:mm a';

String formatDate(DateTime datt) {
  return DateFormat(dateForm).format(datt);
}

String formatDateStan(DateTime datt) {
  return DateFormat.yMMMd().format(datt);
}
