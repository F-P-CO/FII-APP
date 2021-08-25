import 'package:fii_app/core/presentation/components/header_app_bar_component.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/no_scroll_glow_behavior.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class ComparatorPage extends StatelessWidget {
  const ComparatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HeaderAppBarComponent(
        title: 'Comparador',
        settingsOnPressed: () {},
        searchOnPressed: () {},
      ),
      body: ScrollConfiguration(
        behavior: NoScrollGlowBehavior(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Código do Fundo")),
                DataColumn(label: Text("Setor")),
                DataColumn(label: Text("Preço atual")),
                DataColumn(label: Text("Liquidez Diária")),
                DataColumn(label: Text("Dividendo")),
                DataColumn(label: Text("Dividend Yield")),
                DataColumn(label: Text("DY (3M) Acumulado")),
                DataColumn(label: Text("DY (6M) Acumulado")),
                DataColumn(label: Text("DY (12M) Acumulado")),
                DataColumn(label: Text("DY (3M) Média")),
                DataColumn(label: Text("DY (6M) Média")),
                DataColumn(label: Text("DY (12M) Média")),
                DataColumn(label: Text("DY Ano")),
                DataColumn(label: Text("Variação Preço")),
              ],
              rows: [
                for (int i = 0; i < 50; i++)
                  DataRow(
                    cells: [
                      DataCell(Text("ABCP11")),
                      DataCell(Text("Shoppings")),
                      DataCell(Text("R\$30,00")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                      DataCell(Text("0,5%")),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
