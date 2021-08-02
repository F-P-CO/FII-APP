import 'package:fii_app/modules/home/components/reit_card_component.dart';
import 'package:fii_app/shared/components/bottom_sheet_component.dart';
import 'package:fii_app/shared/hooks/use_navigator_service_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'shared/stores/reit_store.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final store = GetIt.I.get<ReitStore>();
  final navigator = useNavigatorService();
  String? currentValue = '1';

  @override
  void initState() {
    super.initState();

    // após cadastrar paciente:
    // TODO: limpar filtros;
    // TODO: Retornar para '/';
    // TODO: Listar pacientes.
    /*
      ! const createPatient(patient, callback) {
        ... create patient;
        callback();
      
      createPatient(patient, () => {
        resetFilters()
        history.replace('/')
        listPatients
      })
    */

    autorun((_) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                if (store.isListLoading) {
                  return const CircularProgressIndicator();
                }

                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: store.loadReitsList,
                        child: const Text(
                          'Listar',
                        ),
                      ),
                      Text(currentValue.toString()),
                      MaterialButton(
                        onPressed: () {
                          showModalSheet(
                              config: ModalBottomSheetConfiguration(
                                  context: context,
                                  currentValue: currentValue.toString(),
                                  options: [
                                ModalSheetOption(
                                  label: 'Valor patrimonial',
                                  id: '1',
                                  onPressed: (String? newValue) {
                                    setState(() {
                                      currentValue = newValue;
                                    });
                                  },
                                ),
                                ModalSheetOption(
                                  label: 'Dividend Yield',
                                  id: '2',
                                  onPressed: (String? newValue) {
                                    setState(() {
                                      currentValue = newValue;
                                    });
                                  },
                                ),
                                ModalSheetOption(
                                  label: 'Patrimônios',
                                  id: '3',
                                  onPressed: (String? newValue) {
                                    setState(() {
                                      currentValue = newValue;
                                    });
                                  },
                                ),
                              ]));
                        },
                        child: const Text(
                          'Configurar lista',
                        ),
                      ),
                      Column(
                        children: store.reitsByNetWorth.map((reit) {
                          return ReitCardComponent(reit: reit);
                        }).toList(),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
