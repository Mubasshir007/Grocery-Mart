import 'package:flutter/material.dart';
import 'package:grocery_mart/provider/cartModel.dart';
import 'package:provider/provider.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({
    super.key,
    required this.Item,
  });
  final Item;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return IconButton(
      onPressed: () {
        if (cartProvider.IsInFav(Item)) {
          cartProvider.RemoveFromFav(Item);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(milliseconds: 400),
                content: Text(" ${Item.name} remove from favorite!")),
          );
        } else {
          cartProvider.AddToFav(Item);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(milliseconds: 400),
                content: Text(" ${Item.name} added to favorite!")),
          );
        }
      },
      icon: Icon(
        cartProvider.IsInFav(Item)
            ? Icons.favorite
            : Icons.favorite_border_outlined,
        color: Colors.red,
      ),
    );
  }
}
