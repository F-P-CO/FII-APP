import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ComparatorPage extends StatelessWidget {
  const ComparatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Comparator"),
      ),
      body: const Center(
        child: Text("Comparator"),
      ),
    );
  }
}
