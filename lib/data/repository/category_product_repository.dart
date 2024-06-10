import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasorce/category_product_datasource.dart';
import 'package:flutter_apple_shop/data/model/product.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class ICategoryProductRepository {
  Future<Either<String, List<ProductModel>>> getProductByCategoryId(
      String categoryId);
}

class CategoryProductRepository extends ICategoryProductRepository {
  final ICategoryProductDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<ProductModel>>> getProductByCategoryId(
      String categoryId) async {
    try {
      var response = await _datasource.getProductByCategoryId(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
