import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(const LoadingStateOff()) {
    on<StartLoadingEvent>((event, emit) => emit(const LoadingStateOn()));
    on<StopLoadingEvent>((event, emit) => emit(const LoadingStateOff()));
  }
}
