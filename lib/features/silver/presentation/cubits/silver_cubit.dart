import 'dart:developer';

import 'silver_states.dart';
import '../../data/repo/silver_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SilverCubit extends Cubit<BaseSilverState> {
  SilverCubit({required this.silverRepo}) : super(const InitialSilverState());

  final SilverRepo silverRepo;

  Future<void> getSilver() async {
    emit(const LoadingSilverState());

    final result = await silverRepo();

    log("call from get silver");

    result.fold(
      (error) => emit(FailureSilverState(errorMsg: error.toString())),
      (silverModel) => emit(SuccessSilverState(silverModel: silverModel)),
    );
  }
}
