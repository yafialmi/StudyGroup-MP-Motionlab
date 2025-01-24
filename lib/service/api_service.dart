import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future get(String uri) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    try {
      final response = await dio.get(uri);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}