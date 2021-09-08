import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:flutter/material.dart';
import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:fii_app/core/presentation/themes/app_text_styles.dart';

class ReitCardComponent extends StatelessWidget {
  final Reit reit;
  final ReitColumnType sortType;

  const ReitCardComponent({
    Key? key,
    required this.reit,
    required this.sortType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    reit.symbol,
                    style: AppTextStyles.primaryFont.copyWith(
                      fontSize: 16,
                      fontWeight: AppTextStyles.primaryFontWeightSemibold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                if (sortType == ReitColumnType.netWorth)
                  Text(
                    reit.formattedNetWorth,
                    style: AppTextStyles.primaryFont.copyWith(
                      fontSize: 22,
                      fontWeight: AppTextStyles.primaryFontWeightSemibold,
                      color: AppColors.blackGrey,
                    ),
                  ),
                if (sortType == ReitColumnType.currentDividendYield)
                  Text(
                    reit.currentDividendYield != null
                        ? "${reit.currentDividendYield!.toStringAsFixed(2)}%"
                        : '-',
                    style: AppTextStyles.primaryFont.copyWith(
                      fontSize: 22,
                      fontWeight: AppTextStyles.primaryFontWeightSemibold,
                      color: AppColors.blackGrey,
                    ),
                  ),
                if (sortType == ReitColumnType.assetsAmount)
                  Text(
                    "${reit.assetsAmount} ativos",
                    style: AppTextStyles.primaryFont.copyWith(
                      fontSize: 22,
                      fontWeight: AppTextStyles.primaryFontWeightSemibold,
                      color: AppColors.blackGrey,
                    ),
                  ),
              ],
            ),
          ),
          if (reit.currentPrice != null) ...[
            const SizedBox(height: 8),
            Text(
              reit.formattedCurrentPrice,
              style: AppTextStyles.primaryFont.copyWith(
                fontSize: 14,
                color: AppColors.blackGrey,
              ),
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reit.sector,
                style: AppTextStyles.primaryFont.copyWith(
                  fontSize: 16,
                  fontWeight: AppTextStyles.primaryFontWeightMedium,
                  color: AppColors.blackGrey,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 20,
                    color: AppColors.primary,
                    splashRadius: 15,
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
