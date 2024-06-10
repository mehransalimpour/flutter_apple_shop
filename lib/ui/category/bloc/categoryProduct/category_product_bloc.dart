import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/ui/category/bloc/categoryProduct/category_product_event.dart';
import 'package:flutter_apple_shop/ui/category/bloc/categoryProduct/category_product_state.dart';

import '../../../../data/repository/category_product_repository.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final ICategoryProductRepository _repository = locator.get();

  CategoryProductBloc() : super(CategoryProductLoadingState()) {
    on<CategoryProductInitialize>((event, emit) async {
      var response = await _repository.getProductByCategoryId(event.categoryId);
      emit(CategoryProductResponseSuccessState(response));
    });
  }
}
