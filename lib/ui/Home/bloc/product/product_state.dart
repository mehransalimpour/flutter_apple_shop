import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/category.dart';
import 'package:flutter_apple_shop/data/model/product_image.dart';
import 'package:flutter_apple_shop/data/model/product_varint.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVarint>> productVariant;
  Either<String, Category> productCategory;

  ProductDetailResponseState(
      this.productImages, this.productVariant, this.productCategory);
}
