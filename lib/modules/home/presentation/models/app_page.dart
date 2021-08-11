import 'package:fii_app/modules/home/presentation/components/page_loading.dart';
import 'package:flutter/material.dart';

class AppPage {
  late Widget Function() loading;
  Widget Function() page;
  bool isLoaded = false;

  AppPage({
    Widget Function()? loading,
    required this.page,
  }) {
    if (loading != null) {
      this.loading = loading;
    } else {
      this.loading = () => const PageLoading();
    }
  }
}
