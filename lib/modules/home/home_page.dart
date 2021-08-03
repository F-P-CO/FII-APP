import 'package:fii_app/modules/home/components/reits_list_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: ReitsListComponent(),
      ),
    );
  }
}
