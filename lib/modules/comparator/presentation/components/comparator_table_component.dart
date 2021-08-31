import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/modules/comparator/presentation/components/comparator_table_body_component.dart';
import 'package:fii_app/modules/comparator/presentation/components/comparator_table_header_component.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:lazy_data_table/lazy_data_table.dart';

class ComparatorTableComponent extends StatefulWidget {
  final List<Reit> reits;
  final List<String> symbols;

  ComparatorTableComponent({
    Key? key,
    required this.reits,
  })  : symbols = reits.map((reit) => reit.symbol).toList(),
        super(key: key);

  @override
  _ComparatorTableComponentState createState() =>
      _ComparatorTableComponentState();
}

class _ComparatorTableComponentState extends State<ComparatorTableComponent> {
  final currencyFormatter = GetIt.I.get<NumberFormat>();
  final fixedHeader = "Código";
  final headers = [
    "Setor",
    "Preço atual",
    "Liquidez Diária",
    "Dividendo Atual",
    "Dividend Yield Atual",
    "Patrimônio Liquído",
    "P / VPA",
    "VPA",
    "Vacância",
  ];

  final Map<String, String> cachedCells = {};
  Map<int, double> cellWidthMap = {};

  @override
  void initState() {
    super.initState();
    calculateCellsWidth();
  }

  void calculateCellsWidth() {
    final totalColumns = headers.length;

    for (var column = 0; column < totalColumns; column++) {
      final biggestCellLength = getBiggestCellLength(column);
      final columnWidth = biggestCellLength * 10.0;

      cellWidthMap[column] = columnWidth;
    }
  }

  int getBiggestCellLength(int column) {
    int biggestLength = headers[column].length;

    for (var row = 0; row < widget.reits.length; row++) {
      final cell = getCell(row, column);

      if (cell.length > biggestLength) {
        biggestLength = cell.length;
      }
    }

    return biggestLength;
  }

  String _formatCurrency(double? value) =>
      value != null ? currencyFormatter.format(value) : 'N/A';

  String _formatPercentage(double? value) =>
      value != null ? "${value.toStringAsFixed(2)}%" : '-';

  String _formatDecimal(double? value) =>
      value != null ? value.toStringAsFixed(2) : '-';

  String getCell(int row, int column) {
    final key = "$row-$column";

    if (!cachedCells.containsKey(key)) {
      final String cell;
      final reit = widget.reits.elementAt(row);

      switch (column) {
        case 0:
          cell = reit.sector;
          break;
        case 1:
          cell = _formatCurrency(reit.currentPrice);
          break;
        case 2:
          cell = _formatCurrency(reit.dailyLiquidity);
          break;
        case 3:
          cell = _formatPercentage(reit.currentDividend);
          break;
        case 4:
          cell = _formatPercentage(reit.currentDividendYield);
          break;
        case 5:
          cell = _formatCurrency(reit.netWorth);
          break;
        case 6:
          cell = _formatDecimal(reit.pvpa);
          break;
        case 7:
          cell = _formatCurrency(reit.vpa);
          break;
        case 8:
          cell = _formatPercentage(reit.vacancy);
          break;
        default:
          throw Exception("Column $column is invalid");
      }

      cachedCells[key] = cell;

      return cell;
    }

    return cachedCells[key]!;
  }

  @override
  Widget build(BuildContext context) {
    return LazyDataTable(
      rows: widget.reits.length,
      columns: headers.length,
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
        text: headers.elementAt(column),
      ),
      leftHeaderBuilder: (row) => ComparatorTableBodyComponent(
        text: widget.symbols.elementAt(row),
      ),
      dataCellBuilder: (row, column) => ComparatorTableBodyComponent(
        text: getCell(row, column),
      ),
    );
  }
}
