import 'package:dio/dio.dart';
import 'package:news/services/services.dart';

class HomeServices {
  Dio _dio = Dio();

  Future<Map<String, dynamic>> getHome() async {
    print("mulai get home");

    try {
      var response = await _dio.get(
        '$host/api/innocent/newsapp/articles',
      );

      print(response.data[0]);
      return {
        'code': response.statusCode.toString(),
        'data': response.data,
      };
    } on DioError catch (e) {
      if (e.response != null) {}
      return {
        'code': e.response!.statusCode.toString(),
      };
    }
  }
}
