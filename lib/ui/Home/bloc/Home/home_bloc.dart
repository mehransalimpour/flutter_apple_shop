import 'package:bloc/bloc.dart';

import 'package:flutter_apple_shop/data/repository/product_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/Home/home_event.dart';

import '../../../../data/repository/banner_repository.dart';
import '../../../../data/repository/category_repository.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  final IProductRepository _productRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeEventGetData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getBanners();
      var categoryList = await _categoryRepository.getCategorys();
      var productList = await _productRepository.getProducts();
      var productbestseller = await _productRepository.getBestSeller();
      var productHotest = await _productRepository.getHottest();
      emit(HomeRequestSuccessState(bannerList, categoryList, productList,
          productbestseller, productHotest));
    });
  }
}
