import 'package:core/core.dart';

abstract class StateType {}

class InitialState extends StateType {}

class LoadingState extends StateType {}

class FailureState extends StateType {
  FailureState(this.failure);

  final AppFailure failure;
}

class SuccessState<T> extends StateType {
  SuccessState(this.result);

  final T result;
}
