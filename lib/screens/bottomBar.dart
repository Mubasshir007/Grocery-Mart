import 'package:flutter/material.dart';
import 'package:grocery_mart/screens/account.dart';
import 'package:grocery_mart/screens/cart.dart';
import 'package:grocery_mart/screens/explore.dart';
import 'package:grocery_mart/screens/favorite.dart';
import 'package:grocery_mart/screens/shop.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Shop(),
    Explore(),
    const Cart(),
    const Favorite(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shop.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 0 ? Colors.green : Colors.black,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/explore.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 1 ? Colors.green : Colors.black,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 2 ? Colors.green : Colors.black,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/fav.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 3 ? Colors.green : Colors.black,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 4 ? Colors.green : Colors.black,
            ),
            label: 'Account',
          ),
        ],

        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // For more than 3 items
      ),
    );
  }
}
