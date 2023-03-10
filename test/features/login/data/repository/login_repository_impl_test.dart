import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/data/error_handler.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart';
import 'package:ecom_clean_code/features/login/data/model/login_data_model.dart';
import 'package:ecom_clean_code/features/login/data/repository/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginRemoteDataSource, ErrorHandler])
void main() {
  late LoginRepositoryImpl loginRepositoryImpl;
  late MockLoginRemoteDataSource mockLoginRemoteDataSource;
  late MockErrorHandler mockErrorHandler;

  setUp(() {
    mockLoginRemoteDataSource = MockLoginRemoteDataSource();
    mockErrorHandler = MockErrorHandler();
    loginRepositoryImpl = LoginRepositoryImpl(
      loginRemoteDataSource: mockLoginRemoteDataSource,
      errorHandler: mockErrorHandler,
    );
  });

  const username = "username";
  const password = "password";

  final testLoginModel = LoginDataModel(token: "testToken");

  group("login repository implementation test", () {
    test(
      "should login when the call to remote data source is successful",
      () async {
        //arrange
        when(mockLoginRemoteDataSource.loginUser(username, password))
            .thenAnswer((_) async => testLoginModel);
        //act
        final result = await loginRepositoryImpl.login(username, password);
        //assert
        verify(mockLoginRemoteDataSource.loginUser(username, password));
        expect(result, Right(testLoginModel));
      },
    );

    test(
      'should return Failure when an exception thrown',
      () async {
        // arrange
        when(mockLoginRemoteDataSource.loginUser(any, any))
            .thenThrow(ServerException('Server Error'));

        // act
        final result = await loginRepositoryImpl.login(username, password);

        // assert
        verify(mockLoginRemoteDataSource.loginUser(username, password));
        verifyNoMoreInteractions(mockLoginRemoteDataSource);
        expect(result, equals(Left(Failure('Server Error'))));
      },
    );
  });
}
