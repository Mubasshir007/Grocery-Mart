import 'package:flutter/material.dart';
import 'package:grocery_mart/customs/appcolor.dart';
import 'package:grocery_mart/customs/uihelper.dart';
import 'package:grocery_mart/provider/cartModel.dart';
import 'package:grocery_mart/Widgets/productDetail.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: AppBar(
              title: UiHelper.UiText(
                  data: "Favourite", textsize: 20, textweight: FontWeight.w900),
              centerTitle: true,
            ),
          ),
          const Divider(),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: cartProvider.fav.isEmpty
                  ? UiHelper.UiText(
                      data: "Nothing favourites",
                      textsize: 20,
                      textweight: FontWeight.w800)
                  : ListView.builder(
                      itemCount: cartProvider.fav.length,
                      itemBuilder: (context, index) {
                        final favlist = cartProvider.fav[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                        itemDetail: favlist,
                                      )),
                            );
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 25),
                                    child: SizedBox(
                                        height: screenWidth * .2,
                                        width: screenWidth * .2,
                                        child: Image.asset(
                                          favlist.image,
                                          fit: BoxFit.contain,
                                        )),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UiHelper.UiText(
                                            data: favlist.name,
                                            textsize: screenWidth * .045,
                                            textweight: FontWeight.w900),
                                        UiHelper.UiText(
                                            data: favlist.cname,
                                            textsize: screenWidth * .035,
                                            textweight: FontWeight.w400,
                                            textcolor: Appcolor.Grey),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            cartProvider.RemoveFromFav(favlist);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  duration: const Duration(
                                                      milliseconds: 200),
                                                  content: Text(
                                                      " ${favlist.name} added to cart!")),
                                            );
                                          },
                                          icon: const Icon(
                                              Icons.delete_outline_outlined)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          UiHelper.UiText(
                                              data:
                                                  "\$ ${favlist.rate.toString()}",
                                              textsize: screenWidth * .04,
                                              textweight: FontWeight.w900),
                                          const SizedBox(
                                            width: 05,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: screenWidth * .04,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        );
                      }),
            ),
          ),
        ],
      ),
    ));
  }
}
