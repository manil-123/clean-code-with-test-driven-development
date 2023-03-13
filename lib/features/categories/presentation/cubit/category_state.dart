part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categoriesList;
  final Category selectedCategory;

  const CategoryLoaded(this.categoriesList, this.selectedCategory);
  @override
  List<Object> get props => [
        categoriesList,
        selectedCategory,
      ];

  CategoryLoaded copyWith(
      List<Category>? categoriesList, Category? selectedCategory) {
    return CategoryLoaded(categoriesList ?? this.categoriesList,
        selectedCategory ?? this.selectedCategory);
  }
}

class CategoryFailed extends CategoryState {
  final String errorMessage;
  const CategoryFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
