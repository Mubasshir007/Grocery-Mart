import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:grocery_mart/customs/uihelper.dart';
import 'package:grocery_mart/Widgets/AddToCart.dart';
import 'package:grocery_mart/Widgets/AddToFav.dart';
import 'package:grocery_mart/Widgets/productDetail.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      itemDetail: product,
                    )),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Center(
                  child: Image.asset(
                    product.image,
                    height: screenWidth * 0.22,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),

                // Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        AutoSizeText(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: screenWidth * 0.04,
                              fontFamily: 'Gilroy'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // Subtitle
                        Text(
                          "subtitle",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenWidth * 0.035,
                              fontFamily: 'Gilroy'),
                        ),
                      ],
                    ),
                    FavoriteWidget(Item: product)
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),

                /// Price and Add Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiHelper.UiText(
                        data: "\$ ${product.rate.toString()}",
                        textsize: screenWidth * 0.045,
                        textweight: FontWeight.w900),
                    SizedBox(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        child: addToCart(item: product))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
