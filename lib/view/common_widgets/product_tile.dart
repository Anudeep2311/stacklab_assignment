import 'package:flutter/material.dart';
import 'package:stacklab_e/model/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductTile extends StatelessWidget {
  Product productInfo;
  Function addToCart;
  ProductTile(
      {super.key, required this.productInfo, required this.addToCart()});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade200,
            Colors.blue.shade400,
            Colors.blueGrey.shade200,
            Colors.blueGrey.shade500,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "\u{20B9} ${productInfo.productPrice}",
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
          ),
          Image.asset(
            productInfo.productImgPath,
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
          const SizedBox(height: 10),
          Text(
            productInfo.productName,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 10),
          // Divider(
          //   color: Colors.black26,
          // ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.shade200,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                // border: const Border(
                //   top: BorderSide(color: Colors.black, width: 0.4),
                //   left: BorderSide(width: 0.4, color: Colors.transparent),
                //   right: BorderSide(width: 0.4,color: Colors.transparent),
                //   bottom: BorderSide(width: 0.4,color: Colors.transparent),
                // ),
              ),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => addToCart(),
                child: const Wrap(
                  children: [
                    Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
