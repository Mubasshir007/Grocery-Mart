import 'package:flutter/material.dart';
import 'package:grocery_mart/customs/appcolor.dart';
import 'package:grocery_mart/provider/cartModel.dart';
import 'package:provider/provider.dart';

class addToCart extends StatelessWidget {
  const addToCart({super.key, required this.item});
  final item;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Appcolor.green,
        ),
        child: InkWell(
          onTap: () {
            {
              print('object');
              if (cartProvider.isInCarts(item)) {
                null;
              } else {
                cartProvider.AddToCart(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      duration: const Duration(milliseconds: 200),
                      content: Text(" ${item.name} added to cart!")),
                );
              }
            }
          },
          child: Icon(
            cartProvider.isInCarts(item) ? Icons.check_outlined : Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
