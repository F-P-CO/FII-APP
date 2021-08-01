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
                      Column(
                        children: store.reits
                            .map((reit) => Text(
                                  '${reit.symbol} |  ${reit.currentPrice ?? 'N/A'}',
                                ))
                            .toList(),
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
