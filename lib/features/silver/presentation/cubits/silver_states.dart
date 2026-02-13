import '../../data/models/silver_model.dart';

abstract class BaseSilverState {
  const BaseSilverState();
}

class InitialSilverState extends BaseSilverState {
  const InitialSilverState();
}

class LoadingSilverState extends BaseSilverState {
  const LoadingSilverState();
}

class SuccessSilverState extends BaseSilverState {
  const SuccessSilverState({required this.silverModel});

  final SilverModel silverModel;
}

class FailureSilverState extends BaseSilverState {
  const FailureSilverState({required this.errorMsg});

  final String errorMsg;
}
