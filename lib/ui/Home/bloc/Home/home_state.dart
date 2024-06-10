import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/banner_campain.dart';
import 'package:flutter_apple_shop/data/model/category.dart';
import 'package:flutter_apple_shop/data/model/product.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerlist;
  Either<String, List<Category>> categoryList;
  Either<String, List<ProductModel>> productList;
  Either<String, List<ProductModel>> hotestProductList;
  Either<String, List<ProductModel>> bestSellerProductList;
  HomeRequestSuccessState(this.bannerlist, this.categoryList, this.productList,
      this.bestSellerProductList, this.hotestProductList);
}
