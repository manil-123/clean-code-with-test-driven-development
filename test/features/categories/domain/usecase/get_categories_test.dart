import 'package:dartz/dartz.dart';
import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';
import 'package:ecom_clean_code/features/categories/domain/repository/category_repository.dart';
import 'package:ecom_clean_code/features/categories/domain/usecase/get_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  late GetCategories usecase;
  late MockCategoryRepository mockCategoryRepository;
  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = GetCategories(mockCategoryRepository);
  });

  group('category usecase test', () {
    final testCategories = [
      Category(categoryName: 'category1'),
      Category(categoryName: 'category2'),
    ];

    test(
      "shold get categories list from the repository",
      () async {
        // arrange
        when(
          mockCategoryRepository.fetchCategories(),
        ).thenAnswer(((_) async => Right(testCategories)));

        //act
        final result = await usecase.call(NoParams());

        //assert
        expect(result, Right(testCategories));
        verify(mockCategoryRepository.fetchCategories);
        verifyNoMoreInteractions(mockCategoryRepository);
      },
    );
  });
}
