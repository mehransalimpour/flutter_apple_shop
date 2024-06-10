import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasorce/banner_datasource.dart';
import 'package:flutter_apple_shop/data/model/banner_campain.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampain>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<BannerCampain>>> getBanners() async {
    try {
      var response = await _datasource.getBanners();

      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
