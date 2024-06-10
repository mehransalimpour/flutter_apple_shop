import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasorce/category_datasource.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

import '../model/category.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategorys();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<Category>>> getCategorys() async {
    try {
      var response = await _datasource.getCategorys();

      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
