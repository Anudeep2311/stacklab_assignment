import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacklab_e/model/product_model.dart';
import 'package:stacklab_e/view/common_widgets/cart_item_tile.dart';
import 'package:stacklab_e/view_model/cart_view_model.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        centerTitle: false,
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        elevation: 1.5,
      ),
      body: GetBuilder<AddToCartVM>(
        init: AddToCartVM(),
        builder: (value) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 12),
            // itemCount: 3,
            itemCount: value.cartData.length,
            itemBuilder: (context, index) {
              var data = value.cartData[index];
              return CartItemTile(
                product: data,
                remove: () {
                  value.removeFromCart(value.cartData[index].id);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
        },
      ),
    );
  }
}
