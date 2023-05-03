import 'package:intl/intl.dart';

String? emptyValue(String? value) {
  if (value == null || value.isEmpty) {
    return "Value can't be empty";
  } else {
    return null;
  }
}

String formattedDate(DateTime now) {
  final date = DateFormat('dd/MM/yyyy').format(now);
  return date;
}
