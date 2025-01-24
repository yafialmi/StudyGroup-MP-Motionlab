import 'package:dio/dio.dart';
import 'package:motion_week_2/model/category_model.dart';
import 'package:motion_week_2/model/product_detail_model.dart';
import 'package:motion_week_2/model/product_model.dart';

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

  Future<List<CategoryModel>> getCategories(String uri) async {
    try {
      final response = await dio.get(uri);
      if (response.statusCode == 200 && response.data != null) {
        return CategoryModel.fromJsonList(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ProductModel> getProductByCategory(String uri) async {
    try {
      final response = await dio.get(uri);
      if (response.statusCode == 200 && response.data != null) {
        return ProductModel.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ProductDetailModel> getProductDetail (String uri, int id) async {
    try{
      final response = await dio.get('$uri/$id');
      if(response.statusCode == 200 && response.data != null){
        return ProductDetailModel.fromJson(response.data);
      }else{
        throw Exception(response.statusCode);
      }
    }catch(error){
      throw Exception(error);
    }
  }
}
