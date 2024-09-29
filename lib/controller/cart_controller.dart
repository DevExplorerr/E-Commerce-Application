import '../models/cart_model.dart';
import 'package:get/get.dart';
import '../models/model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  // Total price
  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + item.product.price * item.quantity);

  // Total quantity
  int get totalQuantity =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  void addToCart(AllProduts product) {
    var index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(CartItem(product: product, quantity: 1));
    }
  }

  void removeFromCart(AllProduts product) {
    var index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity -= 1;
    } else {
      cartItems.removeAt(index);
    }
  }
}
