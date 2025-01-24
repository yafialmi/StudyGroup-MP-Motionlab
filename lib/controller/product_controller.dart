import 'package:get/get.dart';
import 'package:motion_week_2/model/product_model.dart';
import 'package:motion_week_2/service/api_service.dart';

class ProductController extends GetxController {
  final apiService = ApiService();
  final products = <Product>[].obs;
  final isLoading = false.obs;

  Future<ProductModel> getProductsByCategories(String uri) async {
    try {
      isLoading.value = true;
      final response = await apiService.getProductByCategory(uri);
      products.assignAll(response.products);
      return response;
    } catch (error) {
      throw Exception('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
