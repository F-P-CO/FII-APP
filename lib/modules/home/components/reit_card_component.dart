import 'package:fii_app/shared/hooks/use_format_currency_hook.dart';
import 'package:fii_app/shared/models/reit.dart';
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
              color: const Color(0xFFE9DCD3),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reit.symbol,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                Text(
                  currencyFormatter.format(reit.currentPrice),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Patrimônio total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text(
                      currencyFormatter.format(reit.netWorth),
                      style: const TextStyle(fontSize: 18.0),
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
