import 'package:get/get.dart';
import 'package:motion_week_2/model/category_model.dart';
import 'package:motion_week_2/service/api_service.dart';

class CategoryController extends GetxController {
  final apiService = ApiService();
  final categories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final dataCategories = await apiService
          .getCategories('https://dummyjson.com/products/categories');
      categories.assignAll(dataCategories);
    } catch (error) {
      throw Exception('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
