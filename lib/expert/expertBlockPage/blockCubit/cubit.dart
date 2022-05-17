import 'dart:developer';

import 'package:fantips/expert/data/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositoryBlock/expert_repository.dart';
import 'state_cubit.dart';

class ExpertCubit extends Cubit<ExpertState> {
  // int count = 1;
  ExpertCubit() : super(InitialState());

  // final ApiRepository repository;
  Future<void> expertFetchData(String sdata) async {
    try {
      emit(LoadingState("Loading..."));

      final Expert? expert = await ApiRepository.getExpertList(sdata);

      emit(LoadedState(expert: expert!));
      // final Expert? paginationExpert = await ApiRepository.getExpertList(value);

      // emit(PaginationState(pexpert: paginationExpert!));
      // count++;
      // log("message------> ${expert.tipsters!.first.name}");
      // log("yes yes");
    } catch (e) {
      emit(ErrorState(Faliuer: "not loaeded"));
      print(e);
    } finally {}
  }
}
