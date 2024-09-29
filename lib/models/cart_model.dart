// Cart Item Class
import 'model.dart';

class CartItem {
  AllProduts product; // The product in the cart
  int quantity; // Quantity of the product in the cart

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  // Calculate the total price of the product based on quantity
  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "quantity": quantity,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        product: AllProduts.fromJson(json["product"]),
        quantity: json["quantity"],
      );
}
