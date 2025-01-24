import 'package:get/get.dart';
import 'package:motion_week_2/model/product_detail_model.dart';
import 'package:motion_week_2/service/api_service.dart';

class ProductDetailController extends GetxController {
  final apiService = ApiService();
  final productDetail = Rxn<ProductDetailModel>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments as int;
    getProductDetail(id);
  }

  Future<ProductDetailModel> getProductDetail(int id) async {
    try {
      isLoading.value = true;
      final response = await apiService.getProductDetail(
          'https://dummyjson.com/products', id);
      productDetail.value = response;
      return response;
    } catch (error) {
      throw Exception('Error: $error');
    }finally{
      isLoading.value = false;
    }
  }
}
