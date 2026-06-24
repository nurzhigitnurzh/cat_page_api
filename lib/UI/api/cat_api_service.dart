import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../models/cat_model.dart';

class CatApiService {
  final Dio _dio = Dio();

  Future<List<CatModel>> getCats() async {
    _dio.interceptors.add(TalkerDioLogger());
    final Response response = await _dio.get(
      'https://api.thecatapi.com/v1/images/search',
      queryParameters: {'limit': 1},
    );
    List<CatModel> listCat = <CatModel>[];
    response.data.forEach((dynamic json) {
      listCat.add(CatModel.fromJson(json));
    });
    return listCat;
  }
}