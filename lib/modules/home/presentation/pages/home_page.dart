import 'package:fii_app/modules/reit_list/presentation/pages/reit_list_page.dart';
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
      body: SingleChildScrollView(
        child: ReitListPage(),
      ),
    );
  }
}
