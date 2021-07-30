import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'shared/stores/reit_store.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(),
          Observer(
            builder: (_) {
              final store = GetIt.I.get<ReitStore>();
              return Container(
                child: Text(store.text, style: TextStyle(fontSize: 36)),
              );
            },
          ),
        ],
      ),
    );
  }
}
