import 'package:get/get.dart';

class CartController extends GetxController {
  final quantity = {}.obs;

   void quantityIncrement(int id) {
    if (quantity.containsKey(id)) {
      quantity[id] = quantity[id]! + 1;
    } else {
      quantity[id] = 1; 
    }
  }
  void quantityDecrement(int id) {
    if (quantity.containsKey(id) && quantity[id]! > 1) {
      quantity[id] = quantity[id]! - 1;
    }
  }

  int getQuantity(int id) => quantity[id] ?? 0;
}
