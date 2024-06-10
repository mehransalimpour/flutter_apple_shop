import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';
import '../datasorce/product_datasource.dart';
import '../model/product.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, List<ProductModel>>> getBestSeller();
  Future<Either<String, List<ProductModel>>> getHottest();
}

class ProductRepository extends IProductRepository {
  final IProductDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var response = await _datasource.getProducts();

      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getBestSeller() async {
    try {
      var response = await _datasource.getBestseller();

      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getHottest() async {
    try {
      var response = await _datasource.getHotest();

      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
