import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_model.dart';
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUser extends Usecase<LoginEntity, LoginParams> {
  final LoginRepository loginRepository;

  LoginUser(this.loginRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await loginRepository.login(params.username, params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
