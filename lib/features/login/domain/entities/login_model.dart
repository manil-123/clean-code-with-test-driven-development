import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String token;

  LoginModel({required this.token});

  @override
  List<Object> get props => [token];
}
