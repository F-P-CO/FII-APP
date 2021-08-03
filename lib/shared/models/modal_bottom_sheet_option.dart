import 'package:fii_app/shared/models/reit.dart';

class ModalBottomSheetOrderingOption {
  final String label;
  final List<Reit> Function() orderedList;

  ModalBottomSheetOrderingOption({
    required this.label,
    required this.orderedList,
  });
}
