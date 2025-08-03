import 'package:flutter/material.dart';
import 'package:grocery_mart/customs/appcolor.dart';
import 'package:grocery_mart/customs/uihelper.dart';
import 'package:grocery_mart/Widgets/AddToCart.dart';
import 'package:grocery_mart/Widgets/AddToFav.dart';

class ProductDetail extends StatelessWidget {
  final itemDetail;
  const ProductDetail({super.key, required this.itemDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: AppBar(
                  title: UiHelper.UiText(
                      data: itemDetail.name,
                      textsize: 20,
                      textweight: FontWeight.w900),
                  centerTitle: true,
                ),
              )),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.UiText(
                      data: "Top Quality",
                      textsize: 50,
                      textweight: FontWeight.w100),
                  UiHelper.UiText(
                      data: itemDetail.name,
                      textsize: 50,
                      textweight: FontWeight.w600),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .65,
                        child: Image.asset(
                          itemDetail.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey[200]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FavoriteWidget(
                                Item: itemDetail,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Icon(
                                Icons.menu_rounded,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  UiHelper.UiText(
                      data: "\$ ${itemDetail.rate.toString()}/kg",
                      textsize: 20,
                      textweight: FontWeight.w600,
                      textcolor: Appcolor.green),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          UiHelper.UiText(
                              data: "Description",
                              textsize: 20,
                              textweight: FontWeight.w400),
                          UiHelper.UiText(
                              data: itemDetail.description,
                              textsize: 18,
                              textweight: FontWeight.w400,
                              textcolor: Appcolor.Grey),
                          const SizedBox(
                            height: 10,
                          ),
                          UiHelper.UiText(
                              data: "Fact",
                              textsize: 20,
                              textweight: FontWeight.w400),
                          UiHelper.UiText(
                              data: itemDetail.fact,
                              textsize: 18,
                              textweight: FontWeight.w400,
                              textcolor: Appcolor.Grey)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Appcolor.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UiHelper.UiText(
                      data: "Add to Basket",
                      textsize: 20,
                      textcolor: Colors.white,
                      textweight: FontWeight.w900),
                  addToCart(
                    item: itemDetail,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
