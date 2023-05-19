import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/error/app_error.dart';
import 'package:bloc_tutorial/logic/extension/add_without_duplicate.dart';
import 'package:meta/meta.dart';

part 'app_error_event.dart';
part 'app_error_state.dart';

class AppErrorBloc extends Bloc<AppErrorEvent, AppErrorState> {
  List<AppError> errors = [];

  AppErrorBloc() : super(const AppErrorInitial()) {
    on<AppErrorEvent>((event, emit) {
      errors.addWithoutDuplicate(event.error);

      if (state.error == null) {
        emit(AppErrorState(event.error));
      }
    });

    on<AppErrorRomoveEvent>((event, emit) {
      errors.remove(event.error);

      if (errors.isNotEmpty) {
        emit(AppErrorState(errors.first));
      } else {
        emit(const AppErrorInitial());
      }
    });
  }
}
