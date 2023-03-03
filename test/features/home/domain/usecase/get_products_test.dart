import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/error/failures.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:ecom_clean_code/features/home/domain/repository/product_repository.dart';
import 'package:ecom_clean_code/features/home/domain/usecase/get_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_products_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetProducts usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProducts(productRepository: mockProductRepository);
  });

  group("usecase test", () {
    final productsList = [
      Product(
          id: 1,
          title: "Title",
          price: 109.95,
          description: "Description",
          category: "Category",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating: Rating(
            rate: 3.9,
            count: 120,
          ))
    ];

    test(
      "shold get products list from the repository",
      () async {
        // arrange
        when(
          mockProductRepository.fetchProducts(),
        ).thenAnswer(((_) async => Right(productsList)));

        //act
        final result = await usecase(NoParams());

        //assert
        expect(result, Right(productsList));
        verify(mockProductRepository.fetchProducts()).called(1);
        verifyNoMoreInteractions(mockProductRepository);
      },
    );

    test(
      'should return server failure',
      () async {
        //arrange
        when(mockProductRepository.fetchProducts())
            .thenAnswer((_) async => Left(Failure("")));

        //act
        final result = await usecase(NoParams());

        //assert
        verify(mockProductRepository.fetchProducts());
        verifyNoMoreInteractions(mockProductRepository);
        expect(result, Left(Failure("")));
      },
    );
  });
}
