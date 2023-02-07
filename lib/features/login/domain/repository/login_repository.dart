import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>>? login(String username, String password);
}
