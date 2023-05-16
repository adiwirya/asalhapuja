import 'package:intl/intl.dart';

String? emptyValue(String? value) {
  if (value == null || value.isEmpty) {
    return 'Input Tidak Boleh Kosong';
  } else {
    return null;
  }
}

String formattedDate(DateTime now) {
  final date = DateFormat('dd/MM/yyyy').format(now);
  return date;
}
