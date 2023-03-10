import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/login/domain/entities/login_entity.dart';
import 'package:ecom_clean_code/features/login/domain/usecase/login_user.dart';
import 'package:ecom_clean_code/features/login/presentation/blocs/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_cubit_test.mocks.dart';

@GenerateMocks([LoginUser, SharedPreferences])
void main() {
  late LoginCubit loginCubit;
  late MockLoginUser usecase;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    usecase = MockLoginUser();
    mockSharedPreferences = MockSharedPreferences();
    loginCubit = LoginCubit(usecase, mockSharedPreferences);
  });

  group('isLoggedIn', () {
    test('returns false when authToken is null', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      final result = await loginCubit.isLoggedIn();

      expect(result, false);
      verify(mockSharedPreferences
          .getString(SharedPreferencesConstants.authToken));
      verifyNoMoreInteractions(mockSharedPreferences);
    });

    test('returns true when authToken is not null', () async {
      when(mockSharedPreferences.getString(any)).thenReturn('auth_token');

      final result = await loginCubit.isLoggedIn();

      expect(result, true);
      verify(mockSharedPreferences
          .getString(SharedPreferencesConstants.authToken));
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });

  group('login cubit test', () {
    const username = "username";
    const password = "password";
    final user = LoginEntity(token: "test_admin");
    test(
      "initialState should be Empty",
      () {
        //assert
        expect(loginCubit.state, equals(LoginInitial()));
      },
    );

    group('login', () {
      const username = 'test_username';
      const password = 'test_password';

      final loginModel = LoginEntity(token: 'test_token');

      test('emits LoginLoading and LoginLoaded on successful login', () async {
        when(usecase.call(any)).thenAnswer((_) async => Right(loginModel));
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) => Future.value(true));

        final expectedStates = [
          LoginLoading(),
          LoginLoaded(loginModel: loginModel),
        ];

        loginCubit.login(username, password);

        expect(loginCubit, emitsInOrder(expectedStates));

        verify(
            usecase.call(LoginParams(username: username, password: password)));
        verify(mockSharedPreferences.setString(
            SharedPreferencesConstants.authToken, loginModel.token));
        verifyNoMoreInteractions(usecase);
        verifyNoMoreInteractions(mockSharedPreferences);
      });

      test('emits LoginLoading and LoginFailed on failed login', () async {
        const errorMessage = 'test_error_message';
        when(usecase.call(any))
            .thenAnswer((_) async => Left(Failure(errorMessage)));

        final expectedStates = [
          LoginLoading(),
          LoginFailed(errorMessage: errorMessage),
        ];

        loginCubit.login(username, password);

        expect(loginCubit, emitsInOrder(expectedStates));

        verify(
            usecase.call(LoginParams(username: username, password: password)));
        verifyNoMoreInteractions(usecase);
        verifyZeroInteractions(mockSharedPreferences);
      });
    });
  });
}
