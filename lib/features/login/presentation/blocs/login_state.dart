part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginModel loginModel;

  const LoginLoaded({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class LoginFailed extends LoginState {
  final String errorMessage;

  const LoginFailed({required this.errorMessage});
}
