//  T denotes return type of the remote source
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import '../constants/constants.dart';
import '../error/failures.dart';

class ErrorHandler {
  Future<Either<Failure, T>> handleError<T>(
    dynamic remoteSource,
  ) async {
    try {
      var data = await remoteSource;
      return Right(data as T);
    } on SocketException catch (error) {
      return Left(
        Failure(
          error.message,
        ),
      );
    } on ServerException catch (error) {
      return Left(
        Failure(
          error.exceptionMessage.toString(),
        ),
      );
    } on CacheException catch (error) {
      return Left(
        Failure(
          error.exceptionMessage,
        ),
      );
    } on UnauthorisedException catch (error) {
      return Left(
        Failure(error.exceptionMessage),
      );
    } on NotFoundException catch (error) {
      return Left(
        Failure(error.exceptionMessage),
      );
    } catch (error) {
      return const Left(
        Failure(
          ErrorMessage.somethingWentWrongFailureMessage,
        ),
      );
    }
  }
}
