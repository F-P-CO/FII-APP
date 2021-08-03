import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:get_it/get_it.dart';

part 'reit_list_event.dart';
part 'reit_list_state.dart';

class ReitListBloc extends Bloc<ReitListEvent, ReitListState> {
  final reitRepository = GetIt.I.get<ReitRepository>();

  ReitListBloc() : super(ReitListInitial());

  @override
  Stream<ReitListState> mapEventToState(
    ReitListEvent event,
  ) async* {
    if (event is ReitListLoaded) {
      yield* _mapReitListLoadedToState(event);
    }
  }

  Stream<ReitListState> _mapReitListLoadedToState(ReitListLoaded event) async* {
    yield ReitListLoadInProgress();

    try {
      final reits = await reitRepository.getAll();

      switch (event.orderBy) {
        case ReitListOrderOption.netWorth:
          reits.sort((a, b) => b.netWorth?.compareTo(a.netWorth ?? 0) ?? 0);
          break;
        case ReitListOrderOption.currentDividendYield:
          reits.sort((a, b) =>
              b.currentDividendYield?.compareTo(a.currentDividendYield ?? 0) ??
              0);
          break;
        case ReitListOrderOption.assetsAmount:
          reits.sort((a, b) => b.assetsAmount.compareTo(a.assetsAmount));
          break;
        default:
      }

      yield ReitListLoadSuccess(reits: reits);
    } catch (e) {
      yield const ReitListLoadError(
        message: "Erro ao buscar lista de fundos.",
      );
    }
  }
}
