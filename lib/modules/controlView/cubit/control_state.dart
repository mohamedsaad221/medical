part of 'control_cubit.dart';

@immutable
abstract class ControlState {}

class ControlInitial extends ControlState {}

class ControlConnectionFailed extends ControlState {}

class ControlConnectionSuccess extends ControlState {}

class ChangeLanguageState extends ControlState {}

class ClearLanguageState extends ControlState {}
class LoginPasswordVisibility extends ControlState {}


class LoginLoadingState extends ControlState {}
class LoginSuccessState extends ControlState {}
class LoginErrorState extends ControlState {}
