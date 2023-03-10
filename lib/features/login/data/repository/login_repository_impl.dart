import 'package:ecom_clean_code/core/data/error_handler.dart';
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart';
import 'package:ecom_clean_code/features/login/data/model/login_data_model.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_entity.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ErrorHandler errorHandler;
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({
    required this.errorHandler,
    required this.loginRemoteDataSource,
  });
  @override
  Future<Either<Failure, LoginEntity>> login(
      String username, String password) async {
    return await errorHandler.handleError<LoginDataModel>(
      loginRemoteDataSource.loginUser(username, password),
    );
  }
}
