import 'package:grocery_mart/data/detail.dart';

class CartItem {
  final Item item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});

  double get totalPrice => item.rate * quantity;

  Map<String, dynamic> toJson() => {
        'item': item.toJson(),
        'quantity': quantity,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        item: Item.fromJson(json['item']),
        quantity: json['quantity'],
      );
}
