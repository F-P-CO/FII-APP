import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
import 'package:fii_app/modules/home/presentation/stores/navigation_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  final navigationStore = GetIt.I.get<NavigationStore>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Observer(
        builder: (_) => IndexedStack(
          index: navigationStore.currentPageIndex,
          children: navigationStore.pages
              .map<Widget>(
                (page) => page.isLoaded ? page.page() : page.loading(),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          backgroundColor: AppColors.background,
          unselectedFontSize: 13,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: AppTextStyles.primaryFont,
          unselectedLabelStyle: AppTextStyles.primaryFont,
          currentIndex: navigationStore.currentPageIndex,
          onTap: navigationStore.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.compare_arrows_outlined,
                size: 28,
              ),
              label: 'Comparador',
            ),
          ],
        ),
      ),
    );
  }
}
