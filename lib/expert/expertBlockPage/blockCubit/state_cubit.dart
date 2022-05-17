import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/api_service.dart';
import '../../data/model.dart';

abstract class ExpertState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ExpertState {
  InitialState();
}

class LoadingState extends ExpertState {
  final String massage;

  LoadingState(this.massage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends ExpertState {
  final Expert expert;

  LoadedState({required this.expert});

  @override
  List<Object?> get props => [expert];
}

// class PaginationState extends ExpertState {
//   final Expert pexpert;
//
//   PaginationState({required this.pexpert});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [pexpert];
// }

class ErrorState extends ExpertState {
  final String Faliuer;

  ErrorState({required this.Faliuer});

  @override
  List<Object?> get props => [Faliuer];
}

// abstract class BeerEvent {
//   const BeerEvent();
// }
//
// class BeerFetchEvent extends BeerEvent {
//   const BeerFetchEvent();
// }
