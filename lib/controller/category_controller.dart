import 'package:get/get.dart';
import 'package:motion_week_2/model/category_model.dart';
import 'package:motion_week_2/service/api_service.dart';

class CategoryController extends GetxController {
  final apiService = ApiService();
  final categories = <CategoryModel>[].obs;
  final isLoading = false.obs;
  CategoryController() {
    getCategory();
  }

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final data = await apiService
          .get('https://dummyjson.com/products/categories') as List;
      categories.assignAll(
        data.map((item) => CategoryModel.fromJson(item)).toList(),
      );
    } catch (error) {
      throw Exception('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
