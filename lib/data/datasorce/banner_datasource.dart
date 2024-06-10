import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/banner_campain.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IBannerDataSource {
  Future<List<BannerCampain>> getBanners();
}

class BannerRemoteDatasource extends IBannerDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<BannerCampain>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerCampain>(
              (jSonObject) => BannerCampain.fromJson(jSonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
