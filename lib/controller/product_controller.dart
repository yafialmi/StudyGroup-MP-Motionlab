import 'package:get/get.dart';
import 'package:motion_week_2/model/product_model.dart';
import 'package:motion_week_2/service/api_service.dart';

class ProductController extends GetxController {
  final apiService = ApiService();
  final products = <ProductModel>[].obs;
  final isLoading = false.obs;

  Future getProducts(String uri) async {
    try {
      isLoading.value = true;
      final response = await apiService.get(uri);
      final data = ProductModel.fromJson(response);
      products.assignAll([data]);
    } catch (error) {
      throw Exception('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
