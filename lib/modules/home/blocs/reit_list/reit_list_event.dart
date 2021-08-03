part of 'reit_list_bloc.dart';

abstract class ReitListEvent extends Equatable {
  const ReitListEvent();

  @override
  List<Object> get props => [];
}

class ReitListStarted extends ReitListEvent {}

enum ReitListOrderOption { netWorth, currentDividendYield, assetsAmount }

class ReitListLoaded extends ReitListEvent {
  final ReitListOrderOption? orderBy;

  const ReitListLoaded({this.orderBy});
}
