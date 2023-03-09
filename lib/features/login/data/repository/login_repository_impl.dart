import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_model.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, LoginModel>> login(
      String username, String password) async {
    try {
      final loginResponse =
          await loginRemoteDataSource.loginUser(username, password);
      return Right(loginResponse);
    } on ServerException catch (error) {
      return Left(
        Failure(error.exceptionMessage),
      );
    }
  }
}
