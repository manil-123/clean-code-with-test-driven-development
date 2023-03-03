import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart';
import 'package:ecom_clean_code/features/home/data/model/product_data_model.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'product_remote_data_source_test.mocks.dart';

@GenerateMocks([Client, SharedPreferences])
void main() {
  late ProductsRemoteDataSource remoteDataSource;
  late MockClient mockClient;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockClient = MockClient();
    mockSharedPreferences = MockSharedPreferences();
    remoteDataSource =
        ProductsRemoteDataSource(mockClient, mockSharedPreferences);
  });

  group('products remote data source test', () {
    String testToken = "tToken";
    final productsList = [
      ProductDataModel(
          id: 1,
          title: "Title",
          price: 109.95,
          description: "Description",
          category: "Category",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating: RatingDataModel(
            rate: 3.9,
            count: 120,
          ))
    ];

    void setUpHttpSuccess200() {
      when(mockSharedPreferences
              .getString(SharedPreferencesConstants.authToken))
          .thenAnswer(
        (_) => testToken,
      );
      when(mockClient.get(
        any,
        headers: anyNamed('headers'),
      )).thenAnswer(
          (_) async => Response(fixture('products_response_model.json'), 200));
    }

    void setUpHttpFailure404() {
      when(mockSharedPreferences
              .getString(SharedPreferencesConstants.authToken))
          .thenAnswer(
        (realInvocation) => testToken,
      );
      when(mockClient.get(
        any,
        headers: {
          'Authorization': testToken,
          'content-type': 'application/json',
        },
      )).thenAnswer((_) async => Response('Something went wrong', 404));
    }

    test(
      "shoud get token",
      () async {
        //arrange
        setUpHttpSuccess200();
        //act
        final tToken = mockSharedPreferences
            .getString(SharedPreferencesConstants.authToken);
        //assert
        verify(mockSharedPreferences
            .getString(SharedPreferencesConstants.authToken));
        expect(tToken, testToken);
      },
    );
    test(
      "should call get request and get products list data",
      () async {
        //arrange
        setUpHttpSuccess200();
        //act
        await remoteDataSource.getProducts();
        //assert
        verify(mockClient.get(
          any,
          headers: {
            'Authorization': testToken,
            'content-type': 'application/json',
          },
        ));
        // expect(result, [testEvent]);
      },
    );

    test(
      "should throw ServerException when the status code is not 200",
      () async {
        //arrange
        setUpHttpFailure404();
        //act
        final result = remoteDataSource.getProducts();
        //assert
        expect(() => result, throwsException);
      },
    );
  });
}
