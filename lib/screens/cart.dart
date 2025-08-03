import 'package:flutter/material.dart';
import 'package:grocery_mart/customs/appcolor.dart';
import 'package:grocery_mart/provider/cartModel.dart';
import 'package:grocery_mart/Widgets/productDetail.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final carttProvider = Provider.of<CartProvider>(context, listen: true);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: AppBar(
              title: const Text(
                "My Cart",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Gilroy'),
              ),
              centerTitle: true,
            ),
          ),
          const Divider(),
          Expanded(
            flex: 9,
            child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartlist = cartProvider.cartItems[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetail(
                                  itemDetail: cartlist.item,
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Row(
                              children: [
                                // 🖼 Image
                                Container(
                                  width: screenWidth * 0.18,
                                  height: screenWidth * 0.18,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xfff7f7f7),
                                  ),
                                  child: Image.asset(cartlist.item.image,
                                      fit: BoxFit.contain),
                                ),
                                const SizedBox(width: 12),

                                // 📦 Name, qty, counter
                                Container(
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartlist.item.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy-Bold'),
                                        ),
                                        Text(
                                          "\$ ${cartlist.item.rate.toString()}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy',
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  if (cartlist.quantity == 1) {
                                                    cartProvider.removeitem(
                                                        cartlist.item);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        400),
                                                            content: Text(
                                                                " ${cartlist.item.name} remove from cart!")));
                                                  } else {
                                                    cartProvider.Decreament(
                                                        cartlist.item);
                                                  }
                                                },
                                                child: Container(
                                                    height: screenWidth * .1,
                                                    width: screenWidth * .1,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: .8)),
                                                    child: const Icon(
                                                        Icons.remove))),
                                            const SizedBox(width: 8),
                                            Text(
                                                carttProvider
                                                    .cartItems[index].quantity
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const SizedBox(width: 8),
                                            InkWell(
                                              onTap: () {
                                                cartProvider.Increament(
                                                    cartlist.item);
                                              },
                                              child: Container(
                                                height: screenWidth * .1,
                                                width: screenWidth * .1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: .8)),
                                                child: const Icon(
                                                  Icons.add,
                                                  weight: 500,
                                                  color: Appcolor.green,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          carttProvider
                                              .removeitem(cartlist.item);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  content: Text(
                                                      " ${cartlist.item.name} remove from cart!")));
                                        },
                                        icon: const Icon(Icons.delete)),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      '\$${cartlist.totalPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Divider line
                          const Divider(
                              height: 1, thickness: 1, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Consumer<CartProvider>(builder: (ctxx, _, child) {
            final carttotall = Provider.of<CartProvider>(ctxx, listen: false);
            return CheckoutButton(total: carttotall.getTotalPrice());
          })
        ],
      ),
    ));
  }
}

class CheckoutButton extends StatelessWidget {
  final double total;

  const CheckoutButton({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: SizedBox(
        width: screenWidth,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to checkout screen in future work
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolor.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 1,
              ),
              const Text(
                "Go to Checkout",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "\$${total.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
