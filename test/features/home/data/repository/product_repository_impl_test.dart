import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/features/home/data/datasource/product_remote_data_source.dart';
import 'package:ecom_clean_code/features/home/data/model/product_data_model.dart';
import 'package:ecom_clean_code/features/home/data/repository/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([ProductsRemoteDataSource])
void main() {
  late ProductRepositoryImpl repositoryImpl;
  late MockProductsRemoteDataSource mockProductsRemoteDataSource;

  setUp(() {
    mockProductsRemoteDataSource = MockProductsRemoteDataSource();
    repositoryImpl = ProductRepositoryImpl(mockProductsRemoteDataSource);
  });

  group("products repository implementaion test", () {
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

    test(
      "should return products list when the call to remote data source is successful",
      () async {
        //arrange
        when(mockProductsRemoteDataSource.getProducts())
            .thenAnswer((_) async => productsList);

        //act
        final result = await repositoryImpl.fetchProducts();

        //assert
        verify(mockProductsRemoteDataSource.getProducts());
        expect(result, Right(productsList));
      },
    );

    test(
        'should return a ServerFailure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockProductsRemoteDataSource.getProducts())
          .thenThrow(ServerException(ErrorMessage.serverFailureMessage));

      // act
      final result = await repositoryImpl.fetchProducts();

      // assert
      verify(mockProductsRemoteDataSource.getProducts());

      expect(result, Left(Failure(ErrorMessage.serverFailureMessage)));
    });

    test('should return a SocketFailure when there is no internet connection',
        () async {
      // arrange
      when(mockProductsRemoteDataSource.getProducts())
          .thenThrow(SocketException('No internet connection'));

      // act
      final result = await repositoryImpl.fetchProducts();

      // assert
      expect(
          result, equals(Left(Failure(ErrorMessage.socketExceptionMessage))));
      verify(mockProductsRemoteDataSource.getProducts());
    });
  });
}
