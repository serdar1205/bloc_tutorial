part of 'loading_bloc.dart';

@immutable
class LoadingState {
  const LoadingState();
}

@immutable
class LoadingStateOn extends LoadingState {
  const LoadingStateOn();
}

class LoadingStateOff extends LoadingState {
  const LoadingStateOff();
}
