import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_model.dart';
import 'package:ecom_clean_code/features/login/domain/repository/login_repository.dart';
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late LoginUser loginUser;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginUser = LoginUser(mockLoginRepository);
  });
  const username = "username";
  const password = "password";

  const testLoginModel = LoginModel(token: "token");

  test(
    "shold get token from the repository",
    () async {
      // arrange
      when(
        mockLoginRepository.login(username, password),
      ).thenAnswer(((_) async => Right(testLoginModel)));

      //act
      final result =
          await loginUser(LoginParams(username: username, password: password));

      //assert
      expect(result, Right(LoginModel(token: "token")));
      verify(mockLoginRepository.login(username, password)).called(1);
      verifyNoMoreInteractions(mockLoginRepository);
    },
  );

  test('should return server failure', () async {
    //arrange
    when(mockLoginRepository.login(username, password))
        .thenAnswer((_) async => Left(Failure("")));

    //act
    final result =
        await loginUser(LoginParams(username: username, password: password));

    //assert
    verify(mockLoginRepository.login(username, password));
    verifyNoMoreInteractions(mockLoginRepository);
    expect(result, Left(Failure("")));
  });
}
