import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/datasorce/banner_datasource.dart';
import 'package:flutter_apple_shop/data/datasorce/category_datasource.dart';
import 'package:flutter_apple_shop/data/datasorce/category_product_datasource.dart';
import 'package:flutter_apple_shop/data/datasorce/product_detail_screen_datasource.dart';
import 'package:flutter_apple_shop/data/repository/banner_repository.dart';
import 'package:flutter_apple_shop/data/repository/category_product_repository.dart';
import 'package:flutter_apple_shop/data/repository/category_repository.dart';
import 'package:flutter_apple_shop/data/repository/product_detail_repository.dart';

import 'package:get_it/get_it.dart';

import '../data/datasorce/product_datasource.dart';
import '../data/repository/product_repository.dart';

var locator = GetIt.instance;
Future<void> getitinit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://startflutter.ir/api/',
      ),
    ),
  );

  //datasources
//dataSorce

  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDatasource());
  locator
      .registerFactory<ICategoryDataSource>(() => CategoryRemoteDatasource());
  locator.registerFactory<IProductDataSource>(() => ProductRemoteDataSource());
  locator.registerFactory<ICategoryProductDatasource>(
      () => CategoryProductRemoteDatasource());
  locator.registerFactory<IDetailProductDatasource>(
      () => DetailProductRemoteDatasource());

  //Repository

  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
  locator.registerFactory<ICategoryProductRepository>(
      () => CategoryProductRepository());
  locator.registerFactory<IDetailProductRepository>(
      () => DetailProductRepository());
}
