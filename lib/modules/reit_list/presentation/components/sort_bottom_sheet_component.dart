// import 'package:fii_app/core/presentation/themes/app_colors.dart';
// import 'package:fii_app/core/presentation/themes/app_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:get_it/get_it.dart';
// import 'package:fii_app/core/navigation/navigator_service.dart';

// import '../stores/reit_list_store.dart';

// class SortBottomSheetComponent extends StatelessWidget {
//   final reitListStore = GetIt.I.get<ReitListStore>();

//   SortBottomSheetComponent({
//     Key? key,
//   }) : super(key: key);

//   void _changeOption(ReitListSortOptionType newOption) {
//     GetIt.I.get<NavigatorService>().currentState!.pop();
//     reitListStore.currentSortOptionType = newOption;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 18, bottom: 10),
//             child: Container(
//               height: 5.0,
//               width: 150.0,
//               decoration: BoxDecoration(
//                 color: AppColors.lightgrey,
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 15, bottom: 5),
//           child: Text(
//             'Ordenar lista',
//             style: AppTextStyles.title,
//           ),
//         ),
//         ...reitListStore.sortOptions
//             .map(
//               (option) => Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       option.label,
//                       style: AppTextStyles.captionBody,
//                     ),
//                     onTap: () => _changeOption(option.type),
//                     trailing: Observer(
//                       builder: (_) {
//                         return Transform.scale(
//                           scale: 1.2,
//                           child: Radio(
//                             value: option.type,
//                             groupValue: reitListStore.currentSortOptionType,
//                             onChanged: (ReitListSortOptionType? option) {
//                               if (option != null) {
//                                 _changeOption(option);
//                               }
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   if (reitListStore.sortOptions.last != option)
//                     const Divider(
//                       thickness: 1.3,
//                       height: 0,
//                     ),
//                 ],
//               ),
//             )
//             .toList(),
//         const SizedBox(
//           height: 50,
//         )
//       ],
//     );
//   }
// }
