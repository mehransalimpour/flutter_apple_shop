import 'package:flutter_apple_shop/data/repository/product_detail_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/product/product_event.dart';
import 'package:flutter_apple_shop/ui/Home/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();

  ProductBloc() : super(ProductInitState()) {
    on<ProductInitializeEvent>((event, emit) async {
      emit(ProductDetailLoadingState());

      var productImages =
          await _productRepository.getProuctImage(event.productId);

      var productVariant =
          await _productRepository.getProductVarinats(event.productId);
      var productCategory =
          await _productRepository.getProductCategory(event.categoryId);

      emit(ProductDetailResponseState(
          productImages, productVariant, productCategory));
    });
  }
}
