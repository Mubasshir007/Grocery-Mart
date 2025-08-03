// import 'package:flutter/material.dart';
// import 'package:grocery_mart/CustomC/appcolor.dart';
// import 'package:grocery_mart/CustomC/uihelper.dart';
// import 'package:grocery_mart/Data/detail.dart';
// import 'package:grocery_mart/Widgets/AddToCart.dart';

// class Shop extends StatelessWidget {
//   const Shop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final recommendedItems = DataRepository.getRecommendedItems();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.location_disabled),
//                   UiHelper.UiText(
//                       data: "Nazimabad,Karachi",
//                       textsize: 20,
//                       textweight: FontWeight.w800)
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SearchBar(),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 150,
//                 color: Appcolor.blue,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   UiHelper.UiText(
//                       data: "Exclusive offer",
//                       textsize: 25,
//                       textweight: FontWeight.w800),
//                   UiHelper.UiText(
//                       data: "see all",
//                       textsize: 20,
//                       textweight: FontWeight.w800),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   height: 250,
//                   child: NewWidget(
//                     recommendedItems: recommendedItems,
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   UiHelper.UiText(
//                       data: "Exclusive offer",
//                       textsize: 25,
//                       textweight: FontWeight.w800),
//                   UiHelper.UiText(
//                       data: "see all",
//                       textsize: 20,
//                       textweight: FontWeight.w800,
//                       textcolor: Appcolor.blue),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   height: 250,
//                   child: NewWidget(
//                     recommendedItems: recommendedItems,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     super.key,
//     required this.recommendedItems,
//   });
//   final List<Item> recommendedItems;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.builder(
//         scrollDirection: Axis.horizontal,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 1.1 / 0.8),
//         itemCount: recommendedItems.length,
//         itemBuilder: (context, index) {
//           final detail = recommendedItems[index];
//           return NewWidget1(detail: detail);
//         },
//       ),
//     );
//   }
// }

// class NewWidget1 extends StatelessWidget {
//   const NewWidget1({
//     super.key,
//     required this.detail,
//   });

//   final dynamic detail;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Appcolor.Grey),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Image.asset(
//               "assets/images/fruits.png",
//               height: 100,
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(height: 12),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               detail.name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           ),
//           SizedBox(height: 4),
//           SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(14),
//                 child: Text(
//                   "\$ ${detail.rate.toString()}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ),
//               addToCart(item: detail)
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:grocery_mart/CustomC/appcolor.dart';
// import 'package:grocery_mart/CustomC/uihelper.dart';
// import 'package:grocery_mart/Data/detail.dart';
// import 'package:grocery_mart/Widgets/AddToCart.dart';
// import 'package:grocery_mart/Widgets/AddToFav.dart';
// import 'package:grocery_mart/data/detail.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final recommendedItems = DataRepository.getRecommendedItems();
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     margin: const EdgeInsets.all(16),
//                     height: MediaQuery.of(context).size.height * .18,
//                     decoration: BoxDecoration(
//                         color: Appcolor.yellow,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset("assets/images/offer.png"),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             UiHelper.UiText(
//                                 data: 'Get',
//                                 textsize: 20,
//                                 textweight: FontWeight.w300,
//                                 textcolor: Appcolor.White),
//                             UiHelper.UiText(
//                                 data: '50% OFF',
//                                 textsize: 26,
//                                 textweight: FontWeight.w800,
//                                 textcolor: Appcolor.White),
//                             UiHelper.UiText(
//                                 data: ' On first 03 offer',
//                                 textsize: 15,
//                                 textweight: FontWeight.w500,
//                                 textcolor: Appcolor.White)
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   UiHelper.UiText(
//                       data: "  Recommended",
//                       textsize: 30,
//                       textweight: FontWeight.w400),
//                   Container(
//                       height: 260,
//                       child: gview(recommendedItems: recommendedItems)),
//                   UiHelper.UiText(
//                       data: "  Recommended",
//                       textsize: 30,
//                       textweight: FontWeight.w400),
//                   Container(
//                       height: 260,
//                       child: gview(recommendedItems: recommendedItems)),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class gview extends StatelessWidget {
//   const gview({
//     super.key,
//     required this.recommendedItems,
//   });
//   final List recommendedItems;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: Padding(
//       padding: const EdgeInsets.all(16),
//       child: GridView.builder(
//           scrollDirection: Axis.horizontal,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 1.1 / .6,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//             crossAxisCount: 1,
//           ),
//           itemCount: recommendedItems.length,
//           itemBuilder: (context, index) {
//             final detail = recommendedItems[index];
//             return InkWell(
//                 // onTap: () {
//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) => detailWidget(
//                 //         item: detail,
//                 //       ),
//                 //     ),
//                 //   );
//                 // },
//                 child: productDetail(detail: detail));
//           }),
//     ));
//   }
// }
// class productDetail extends StatelessWidget {
//   const productDetail({
//     super.key,
//     required this.detail,
//   });

//   final dynamic detail;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400,
//       width: 200,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25), color: Appcolor.lightgrey),
//       child: Stack(
//         children: [
//           Align(
//             alignment: const Alignment(0, 1.5),
//             child: Column(
//               children: [
//                 Container(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 100,
//                   child: Image.asset(
//                     detail.image,
//                     fit: BoxFit.scaleDown,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   width: 70,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black, // Shadow color
//                         spreadRadius: 2, // How much the shadow spreads
//                         blurRadius: 10, // Softness of the shadow
//                         offset: Offset(0, 4), // Horizontal & vertical offset
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Align(
//             alignment: const Alignment(.9, -.9),
//             child: FavoriteWidget(
//               Item: detail,
//             ),
//           ),
//           Align(
//             alignment: const Alignment(-.8, .3),
//             child: UiHelper.UiText(
//                 data: "\$ ${detail.rate.toString()}",
//                 textsize: 18,
//                 textweight: FontWeight.w600),
//           ),
//           Align(
//               alignment: const Alignment(.0, .95),
//               child: addToCart(
//                 item: detail,

//               )),
//           Align(
//             alignment: const Alignment(-.8, .5),
//             child: Text(
//               ("${detail.name}"),
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Image.asset(
//               "assets/images/fruits.png",
//               height: 100,
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(height: 12),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               detail.name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           ),
//           SizedBox(height: 4),
//           SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(14),
//                 child: Text(
//                   "\$ ${detail.rate.toString()}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//               ),
//               addToCart(item: detail)
//             ],
//           ),

import 'package:flutter/material.dart';
import 'package:grocery_mart/Customs/appcolor.dart';
import 'package:grocery_mart/customs/uihelper.dart';
import 'package:grocery_mart/Widgets/productView.dart';

import 'package:grocery_mart/data/detail.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final offer = DataRepository.getRecommendedItems();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // search bar operational in future work
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on_sharp, color: Colors.black),
                      const SizedBox(width: 6),
                      UiHelper.UiText(
                          data: "Saddar, Karachi",
                          textsize: 20,
                          textweight: FontWeight.bold)
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Store",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                CarouselSlider(
                  options: CarouselOptions(
                      height: 120.0,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500)),
                  items: ["Fresh Fruits", "Natural Vegetable", "Diaries & Egg"]
                      .map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Appcolor.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images/offer.png",
                                height: 80,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .045,
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: FittedBox(
                                        child: Text(
                                      i,
                                      style: const TextStyle(
                                          fontSize: 100,
                                          letterSpacing: -3,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .035,
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6),
                                      child: FittedBox(
                                        child: UiHelper.UiText(
                                            data: "Get Up To 40% OFF",
                                            textsize: 12,
                                            textweight: FontWeight.w500,
                                            textcolor: Colors.yellow),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiHelper.UiText(
                        data: "Exclusive offer",
                        textsize: 25,
                        textweight: FontWeight.w700),
                    UiHelper.UiText(
                        data: "See all",
                        textsize: 15,
                        textweight: FontWeight.w700,
                        textcolor: Appcolor.green)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                grid_view(offer: offer),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiHelper.UiText(
                        data: "Exclusive offer",
                        textsize: 25,
                        textweight: FontWeight.bold),
                    UiHelper.UiText(
                        data: "See all",
                        textsize: 15,
                        textweight: FontWeight.bold,
                        textcolor: Appcolor.green)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                grid_view(offer: offer),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiHelper.UiText(
                        data: "Exclusive offer",
                        textsize: 25,
                        textweight: FontWeight.bold),
                    UiHelper.UiText(
                        data: "See all",
                        textsize: 15,
                        textweight: FontWeight.bold,
                        textcolor: Appcolor.green)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                grid_view(offer: offer),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class grid_view extends StatelessWidget {
  const grid_view({
    super.key,
    required this.offer,
  });

  final List<Item> offer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          itemCount: offer.length,
          itemBuilder: (context, index) {
            final product = offer[index];
            return ProductView(product: product);
          }),
    );
  }
}
