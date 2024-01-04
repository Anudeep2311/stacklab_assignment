import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:stacklab_e/model/product_model.dart';

class AddToCartVM extends GetxController {
  List<Product> cartData = [];

  addToCart(Product productData) {
    cartData.add(Product(
        id: productData.id,
        productName: productData.productName,
        productPrice: productData.productPrice,
        productImgPath: productData.productImgPath));
    // print("CART DATA is--> $cartData -----> ${cartData.length}");
    update();
  }

  removeFromCart(String id) {
    cartData.removeWhere((element) => element.id == id);
    update();
  }
}
