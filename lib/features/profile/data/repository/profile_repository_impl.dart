import 'package:ecom_clean_code/features/profile/domain/entity/profile_entity.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

// @LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Either<Failure, ProfileEntity>> fetchProfile() {
    throw UnimplementedError();
  }
}
