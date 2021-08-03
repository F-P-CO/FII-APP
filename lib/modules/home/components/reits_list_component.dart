import 'package:fii_app/modules/home/blocs/reit_list/reit_list_bloc.dart';
import 'package:fii_app/shared/components/ordering_bottom_sheet_component.dart';
import 'package:fii_app/shared/models/modal_bottom_sheet_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'reit_card_component.dart';

class ReitsListComponent extends StatefulWidget {
  const ReitsListComponent({Key? key}) : super(key: key);

  @override
  _ReitsListComponentState createState() => _ReitsListComponentState();
}

class _ReitsListComponentState extends State<ReitsListComponent> {
  final bloc = GetIt.I.get<ReitListBloc>();

  final List<ModalBottomSheetOrderingOption> orderingOptions = [
    ModalBottomSheetOrderingOption(
      label: 'Valor patrimonial',
      orderBy: ReitListOrderOption.netWorth,
    ),
    ModalBottomSheetOrderingOption(
      label: 'Dividend Yield',
      orderBy: ReitListOrderOption.currentDividendYield,
    ),
    ModalBottomSheetOrderingOption(
      label: 'Quantidade de ativos',
      orderBy: ReitListOrderOption.assetsAmount,
    ),
  ];

  late ModalBottomSheetOrderingOption currentOrderingOption =
      orderingOptions.first;

  void _showOrderingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (__, StateSetter setState) {
          return OrderingBottomSheetComponent(
            options: orderingOptions,
            activeOption: currentOrderingOption,
            onChange: (option) {
              bloc.add(
                ReitListLoaded(
                  orderBy: option.orderBy as ReitListOrderOption,
                ),
              );

              setState(() => currentOrderingOption = option);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => bloc.add(
                    ReitListLoaded(
                      orderBy:
                          currentOrderingOption.orderBy as ReitListOrderOption,
                    ),
                  ),
                  child: const Text(
                    'Listar',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _showOrderingBottomSheet(context),
                  child: const Text(
                    'Ordenar',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<ReitListBloc, ReitListState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ReitListInitial) {
                return const Center(
                  child:
                      Text("Clique no botão Listar para carregar os fundos."),
                );
              } else if (state is ReitListLoadInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ReitListLoadSuccess) {
                return Column(
                  children: state.reits
                      .map((reit) => ReitCardComponent(reit: reit))
                      .toList(),
                );
              } else if (state is ReitListLoadError) {
                return Center(
                  child: Text(state.message),
                );
              }

              return const Center(
                child: Text("Erro interno no app."),
              );
            },
          )
        ],
      ),
    );
  }
}
