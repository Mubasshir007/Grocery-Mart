import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_mart/data/detail.dart';
import 'package:grocery_mart/provider/cartitem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  CartProvider() {
    loadCartFromPrefs();
  }
  // add item in cart
  void AddToCart(Item item) {
    bool itemExist = _cartItems.any((test) => test.item.name == item.name);
    if (itemExist) {
      for (var cartItem in _cartItems) {
        if (cartItem.item.name == item.name) {
          null;
        }
      }
    } else {
      _cartItems.add(CartItem(item: item, quantity: 1));
    }
    saveCartToPrefs();
    notifyListeners();
  }

  // delete item from cart
  void removeitem(Item item) {
    _cartItems.removeWhere((test) => test.item.name == item.name);
    saveCartToPrefs();
    notifyListeners();
  }

  // check if the item is in cart or not
  bool isInCarts(Item item) {
    return _cartItems.any((test) => test.item.name == item.name);
  }

  // increase the quantity of item in cart
  void Increament(Item item) {
    for (var cartItem in _cartItems) {
      if (cartItem.item.name == item.name) {
        cartItem.quantity += 1;
      }
    }
    saveCartToPrefs();
    notifyListeners();
    return;
  }

  // decrease the quantity of item in cart
  void Decreament(Item item) {
    for (var cartItem in _cartItems) {
      if (cartItem.item.name == item.name) {
        cartItem.quantity -= 1;
      }
    }
    saveCartToPrefs();
    notifyListeners();
    return;
  }

  //  same function for favorites item
  final List<Item> _fav = [];
  List<Item> get fav => _fav;

  void AddToFav(Item item) {
    _fav.add(item);
    notifyListeners();
  }

  void RemoveFromFav(Item item) {
    _fav.remove(item);
    notifyListeners();
  }

  bool IsInFav(Item item) {
    return _fav.contains(item);
  }

  double getTotalPrice() {
    return _cartItems.fold(0, (total, cartItem) {
      return total + (cartItem.quantity * cartItem.item.rate);
    });
  }

  // Save to SharedPreferences
  Future<void> saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartJson =
        _cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cartItems', cartJson);
  }

  // Load from SharedPreferences
  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cartJson = prefs.getStringList('cartItems');
    if (cartJson != null) {
      _cartItems =
          cartJson.map((item) => CartItem.fromJson(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
