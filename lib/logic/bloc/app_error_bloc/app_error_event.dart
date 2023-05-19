part of 'app_error_bloc.dart';

@immutable
abstract class AppErrorEvent {
  final AppError error;
  const AppErrorEvent(this.error);
}

class AppErrorAddEvent extends AppErrorEvent {
  const AppErrorAddEvent(super.error);
}

class AppErrorRomoveEvent extends AppErrorEvent {
  const AppErrorRomoveEvent(super.error);
}
