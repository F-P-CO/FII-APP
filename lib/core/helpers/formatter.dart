import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

final _currencyFormatter = GetIt.I.get<NumberFormat>();

String formatCurrency(double? value) =>
    value != null ? _currencyFormatter.format(value) : 'N/A';

String formatPercentage(double? value) =>
    value != null ? "${value.toStringAsFixed(2)}%" : '-';

String formatDecimal(double? value) =>
    value != null ? value.toStringAsFixed(2) : '-';
