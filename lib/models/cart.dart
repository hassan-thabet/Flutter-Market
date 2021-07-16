
import 'package:flutter_store/models/product.dart';

class CartItem{
  Product? product;
  double? quantity;

  CartItem(this.product, this.quantity);

  CartItem.fromJson(Map<String , dynamic> jsonObject)
  {
    this.product = Product.fromJson(jsonObject['product']);
    this.quantity = double.tryParse(jsonObject['quantity']);
  }
}


class Cart{

  List<CartItem>? cartItems;
  int? id;
  int? total;

  Cart(this.cartItems, this.id, this.total);

  Cart.fromJson(Map<String , dynamic> jsonObject)
  {

    cartItems = [];
    var items = jsonObject['cart_items'];
    for(var item in items)
    {
      cartItems!.add(CartItem.fromJson(item));

    }

    this.id = jsonObject['id'];
    this.total = jsonObject['total'];
  }
}