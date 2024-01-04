import 'package:flutter/material.dart';
import 'package:stacklab_e/model/product_model.dart';

class CartItemTile extends StatelessWidget {
  Product product;
  Function remove;
  CartItemTile({super.key, required this.product, required this.remove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade500,
              Colors.blue.shade300,
              Colors.blue.shade400,
              Colors.blueGrey.shade200,
              // Colors.blueGrey.shade500,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Image.asset(
                  product.productImgPath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.error_outline,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  product.productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 100,
              width: 100,
              // color: Colors.amber,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\u{20B9}${product.productPrice}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () => remove(),
                    child: const Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "Remove",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 18,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
