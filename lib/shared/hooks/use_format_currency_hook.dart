import 'package:intl/intl.dart';

NumberFormat useFormatCurrency() {
  final formatter =
      NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: 'R\$');
  return formatter;
}
