import '../../data/models/gold_model.dart';

abstract class BaseGoldState {
  const BaseGoldState();
}

class InitialGoldState extends BaseGoldState {
  const InitialGoldState();
}

class LoadingGoldState extends BaseGoldState {
  const LoadingGoldState();
}

class SuccessGoldState extends BaseGoldState {
  const SuccessGoldState({required this.goldModel});

  final GoldModel goldModel;
}

class FailureGoldState extends BaseGoldState {
  const FailureGoldState({required this.errorMessage});

  final String errorMessage;
}
