import 'package:fii_app/shared/hooks/use_format_currency_hook.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/shared/themes/app_colors.dart';
import 'package:fii_app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class ReitCardComponent extends StatelessWidget {
  final Reit reit;

  ReitCardComponent({Key? key, required this.reit}) : super(key: key);

  final currencyFormatter = useFormatCurrency();

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
                    Text(
                      'Patrimônio total',
                      style: AppTextStyles.captionHeader,
                    ),
                    Text(
                      currencyFormatter.format(reit.netWorth),
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
