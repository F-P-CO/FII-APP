import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/navigation/navigator_service.dart';
import '../../../core/presentation/components/page_app_bar_component.dart';
import '../../../core/presentation/stores/comparator_store.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/themes/app_text_styles.dart';
import 'components/filter_list_component.dart';

class ComparatorSettingsPage extends StatelessWidget {
  final navigatorService = GetIt.I.get<NavigatorService>().currentState!;
  final comparatorStore = GetIt.I.get<ComparatorStore>();

  ComparatorSettingsPage({Key? key}) : super(key: key);

  void closePage() => navigatorService.pop();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: PageAppBarComponent(
          title: "Filtros",
          closeOnPressed: closePage,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return TextButton(
                      onPressed: closePage,
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black.withOpacity(0.1),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${comparatorStore.currentReits.length}",
                            style: AppTextStyles.largeBoldHeader.copyWith(
                              color: AppColors.blackGrey,
                            ),
                          ),
                          Text(
                            "fundos correspondentes",
                            style: AppTextStyles.smallHeader.copyWith(
                              color: AppColors.blackGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12.0),
                FilterListComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
