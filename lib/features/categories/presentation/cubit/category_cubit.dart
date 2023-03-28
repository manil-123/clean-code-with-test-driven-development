import 'package:ecom_clean_code/core/usecases/usecase.dart';
import 'package:ecom_clean_code/features/categories/domain/usecase/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories usecase;
  CategoryCubit(this.usecase)
      : super(
          CategoryInitial(),
        );

  void getCategories() async {
    final response = await usecase.call(
      NoParams(),
    );

    response.fold(
      (failure) {
        emit(
          CategoryFailed(errorMessage: failure.failureMessage),
        );
      },
      (categoriesList) {
        emit(
          CategoryLoaded(
            categoriesList,
            Category(categoryName: ''),
          ),
        );
      },
    );
  }

  void updateSelectedCategory(Category newCategory) {
    final state = this.state;
    if (state is! CategoryLoaded) return;
    emit(
      state.copyWith(state.categoriesList, newCategory),
    );
  }

  String getSelectedCategory() {
    final state = this.state;
    if (state is! CategoryLoaded) return '';
    return state.selectedCategory.categoryName;
  }
}
