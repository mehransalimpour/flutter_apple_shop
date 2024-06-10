import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/data/repository/category_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/ui/category/bloc/category_event.dart';
import 'package:flutter_apple_shop/ui/category/bloc/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _categoryRepository = locator.get();

  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryEventGetData>((event, emit) async {
      emit(CategoryLoadingState());

      var categoryList = await _categoryRepository.getCategorys();

      emit(CategoryRequestSuccessState(categoryList));
    });
  }
}
