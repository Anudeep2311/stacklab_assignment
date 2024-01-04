import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:stacklab_e/model/product_model.dart';

class GetMobileProductListVM extends GetxController {
  List<Product> mobileList = Product.getMobileList;

  // getPhonesList() {
  //   mobileList ;
  //   update();
  // }
}

class GetLaptopProductListVM extends GetxController{
  List<Product> laptopList = Product.getLaptopList;
}
