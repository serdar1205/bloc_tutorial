part of 'app_error_bloc.dart';

@immutable
class AppErrorState {
  final AppError? error;
  const AppErrorState(this.error);


}

class AppErrorInitial extends AppErrorState {
  const AppErrorInitial() : super(null);
}
