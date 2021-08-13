import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';

class ReitCardComponent extends StatelessWidget {
  final currencyFormatter = GetIt.I.get<NumberFormat>();

  final Reit reit;
  final ReitListSortOption currentSortOption;

  ReitCardComponent({
    Key? key,
    required this.reit,
    required this.currentSortOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reit.symbol,
                  style: AppTextStyles.title,
                ),
                Text(
                  currencyFormatter.format(reit.currentPrice),
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        currentSortOption.label,
                        style: AppTextStyles.captionTitle,
                      ),
                    ),
                    if (currentSortOption.type ==
                        ReitListSortOptionType.netWorth)
                      Text(
                        currencyFormatter.format(reit.netWorth),
                        style: AppTextStyles.captionBody,
                      ),
                    if (currentSortOption.type ==
                        ReitListSortOptionType.currentDividendYield)
                      Text(
                        reit.currentDividendYield != null
                            ? "${reit.currentDividendYield!.toStringAsFixed(2)}%"
                            : '-',
                        style: AppTextStyles.captionBody,
                      ),
                    if (currentSortOption.type ==
                        ReitListSortOptionType.assetsAmount)
                      Text(
                        reit.assetsAmount.toString(),
                        style: AppTextStyles.captionBody,
                      ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
