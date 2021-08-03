part of 'reit_list_bloc.dart';

abstract class ReitListState extends Equatable {
  const ReitListState();

  @override
  List<Object> get props => [];
}

class ReitListInitial extends ReitListState {}

class ReitListLoadInProgress extends ReitListState {}

class ReitListLoadSuccess extends ReitListState {
  final List<Reit> reits;

  const ReitListLoadSuccess({required this.reits});

  @override
  List<Object> get props => [reits];
}

class ReitListLoadError extends ReitListState {
  final String message;

  const ReitListLoadError({required this.message});

  @override
  List<Object> get props => [message];
}
