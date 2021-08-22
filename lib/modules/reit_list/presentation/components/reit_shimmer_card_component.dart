import 'package:fii_app/core/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReitShimmerCardComponent extends StatelessWidget {
  const ReitShimmerCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 115,
      child: Shimmer.fromColors(
        baseColor: AppColors.lightgrey,
        highlightColor: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: 80,
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: 200,
                  height: 30,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(4.0),
              ),
              width: 60,
              height: 18,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: 120,
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
