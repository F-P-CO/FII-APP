import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/presentation/stores/comparator_store.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/modules/comparator/presentation/components/comparator_table_body_component.dart';
import 'package:fii_app/modules/comparator/presentation/components/comparator_table_header_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

class ComparatorTableComponent extends StatelessWidget {
  final currencyFormatter = GetIt.I.get<NumberFormat>();
  final comparatorStore = GetIt.I.get<ComparatorStore>();

  final fixedHeader = "Código";

  final Map<String, String> cachedCells = {};
  final Map<int, double> cellWidthMap = {};

  final List<Reit> reits;
  final List<String> symbols;

  ComparatorTableComponent({
    Key? key,
    required this.reits,
  })  : symbols = reits.map((reit) => reit.symbol).toList(),
        super(key: key);

  void calculateCellsWidth() {
    final totalColumns = comparatorStore.enabledColumnsInOrder.length;

    for (var column = 0; column < totalColumns; column++) {
      final biggestCellLength = getBiggestCellLength(column);
      final columnWidth = biggestCellLength * 12.0;

      cellWidthMap[column] = columnWidth;
    }
  }

  int getBiggestCellLength(int column) {
    int biggestLength = _getColumnLabel(column).length;

    for (var row = 0; row < reits.length; row++) {
      final cell = getCell(row, column);

      if (cell.length > biggestLength) {
        biggestLength = cell.length;
      }
    }

    return biggestLength;
  }

  String _getColumnLabel(int index) =>
      comparatorStore.enabledColumnsInOrder.elementAt(index).label;

  String _formatCurrency(double? value) =>
      value != null ? currencyFormatter.format(value) : 'N/A';

  String _formatPercentage(double? value) =>
      value != null ? "${value.toStringAsFixed(2)}%" : '-';

  String _formatDecimal(double? value) =>
      value != null ? value.toStringAsFixed(2) : '-';

  String getCell(int rowIndex, int columnIndex) {
    final column = comparatorStore.enabledColumnsInOrder.elementAt(columnIndex);

    final key = "$rowIndex-${column.label}";

    if (!cachedCells.containsKey(key)) {
      final String cell;
      final reit = reits.elementAt(rowIndex);

      switch (column.type) {
        case ReitColumnType.sector:
          cell = reit.sector;
          break;
        case ReitColumnType.currentPrice:
          cell = _formatCurrency(reit.currentPrice);
          break;
        case ReitColumnType.dailyLiquidity:
          cell = _formatCurrency(reit.dailyLiquidity);
          break;
        case ReitColumnType.currentDividend:
          cell = _formatPercentage(reit.currentDividend);
          break;
        case ReitColumnType.currentDividendYield:
          cell = _formatPercentage(reit.currentDividendYield);
          break;
        case ReitColumnType.netWorth:
          cell = _formatCurrency(reit.netWorth);
          break;
        case ReitColumnType.pvpa:
          cell = _formatDecimal(reit.pvpa);
          break;
        case ReitColumnType.vpa:
          cell = _formatCurrency(reit.vpa);
          break;
        case ReitColumnType.vacancy:
          cell = _formatPercentage(reit.vacancy);
          break;
        case ReitColumnType.assetsAmount:
          cell = reit.assetsAmount.toString();
          break;
        default:
          throw Exception("Column $columnIndex is invalid");
      }

      cachedCells[key] = cell;

      return cell;
    }

    return cachedCells[key]!;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        calculateCellsWidth();

        return LazyDataTable(
          rows: reits.length,
          columns: comparatorStore.enabledColumnsInOrder.length,
          tableTheme: const LazyDataTableTheme(
            columnHeaderColor: Colors.transparent,
            columnHeaderBorder: Border(
              bottom: BorderSide(
                color: AppColors.lightgrey,
              ),
            ),
            cornerColor: Colors.transparent,
            cornerBorder: Border(
              bottom: BorderSide(
                color: AppColors.lightgrey,
              ),
            ),
            rowHeaderColor: Colors.transparent,
            rowHeaderBorder: Border.fromBorderSide(
              BorderSide(color: Colors.transparent),
            ),
            alternateRowHeaderColor: Colors.transparent,
            alternateRowHeaderBorder: Border.fromBorderSide(
              BorderSide(color: Colors.transparent),
            ),
            cellColor: Colors.transparent,
            cellBorder: Border.fromBorderSide(
              BorderSide(color: Colors.transparent),
            ),
            alternateCellColor: Colors.transparent,
            alternateCellBorder: Border.fromBorderSide(
              BorderSide(color: Colors.transparent),
            ),
          ),
          tableDimensions: LazyDataTableDimensions(
            leftHeaderWidth: 80,
            customCellWidth: cellWidthMap,
          ),
          topLeftCornerWidget: ComparatorTableHeaderComponent(
            text: fixedHeader,
          ),
          topHeaderBuilder: (column) => ComparatorTableHeaderComponent(
            text: _getColumnLabel(column),
          ),
          leftHeaderBuilder: (row) => ComparatorTableBodyComponent(
            text: symbols.elementAt(row),
          ),
          dataCellBuilder: (row, column) => ComparatorTableBodyComponent(
            text: getCell(row, column),
          ),
        );
      },
    );
  }
}
