import 'dart:developer';

import 'gold_states.dart';
import '../../data/repo/gold_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldCubit extends Cubit<BaseGoldState> {
  GoldCubit({required this.goldRepo}) : super(const InitialGoldState());

  final GoldRepo goldRepo;

  Future<void> getGold() async {
    emit(const LoadingGoldState());

    final result = await goldRepo();

    log("call from get gold");

    result.fold(
      (error) => emit(FailureGoldState(errorMessage: error.toString())),
      (goldModel) => emit(SuccessGoldState(goldModel: goldModel)),
    );
  }
}
