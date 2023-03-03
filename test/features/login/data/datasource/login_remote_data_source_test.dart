import 'package:ecom_clean_code/features/login/data/datasource/login_remote_data_source.dart';
import 'package:ecom_clean_code/features/login/data/model/login_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_remote_data_source_test.mocks.dart';

@GenerateMocks([Client, SharedPreferences])
void main() {
  late MockClient mockClient;
  late MockSharedPreferences mockSharedPreferences;
  late LoginUserRemoteDataSourceImpl remoteDataSource;
  setUp(() {
    mockClient = MockClient();
    mockSharedPreferences = MockSharedPreferences();
    remoteDataSource =
        LoginUserRemoteDataSourceImpl(mockClient, mockSharedPreferences);
  });

  const username = "username";
  const password = "password";

  void setUpHttpSuccess200() {
    when(mockClient.post(
      any,
      body: anyNamed('body'),
      headers: anyNamed('headers'),
    )).thenAnswer(
        (_) async => Response(fixture('login_response_model.json'), 200));
  }

  void setUpHttpFailure404() {
    when(mockClient.post(
      any,
      body: anyNamed('body'),
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => Response('Something went wrong', 404));
  }

  group('login remote data source test', () {
    test(
      "should perform a POST request on a URL with user/login being the endpoint with a header",
      () async {
        //arrange
        setUpHttpSuccess200();
        //act
        await remoteDataSource.loginUser(username, password);
        //assert
        verify(mockClient.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ));
      },
    );

    test(
      "should return login response when the status code is 200 success",
      () async {
        //arrange
        setUpHttpSuccess200();

        //act
        final result = await remoteDataSource.loginUser(username, password);
        //assert
        expect(result, equals(isInstanceOf<LoginDataModel>()));
      },
    );

    test(
      "should throw ServerException when the status code is not 200",
      () async {
        //arrange
        setUpHttpFailure404();
        //act
        final result = remoteDataSource.loginUser(username, password);
        //assert
        expect(result, throwsException);
      },
    );
  });
}
