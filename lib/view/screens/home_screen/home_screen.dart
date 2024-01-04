import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stacklab_e/model/product_model.dart';
import 'package:stacklab_e/view/common_widgets/product_tile.dart';
import 'package:stacklab_e/view/screens/cart_screen/cart_screen.dart';
import 'package:stacklab_e/view_model/cart_view_model.dart';
import 'package:stacklab_e/view_model/product_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  AddToCartVM addCartController = Get.put(AddToCartVM());
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   GetMobileProductListVM().getPhonesList();
    // });

    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            SystemNavigator.pop();
          }, 
          icon: const Icon(Icons.arrow_back)
          ),
        backgroundColor: Colors.blue.shade400,
        centerTitle: true,
        title: const Text(
          "E-Shoppify",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        elevation: 1.5,
        actions: [
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    Get.to(() => const MyCart());
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: GetBuilder<AddToCartVM>(
                  init: AddToCartVM(), // intialize with the Controller
                  builder: (value) => CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        value.cartData.length.toString() ?? "0",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              indicatorPadding: const EdgeInsets.all(0),
              indicatorColor: themeData.primaryColor,
              isScrollable: false,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              controller: tabController,
              tabs: const [Tab(text: "Mobile"), Tab(text: "Laptop")],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // Container(height: 200, width: 200, color: Colors.red),
                  // Container(height: 200, width: 200, color: Colors.red),
                  mobilesView(),
                  laptopView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mobilesView() {
    return GetBuilder<GetMobileProductListVM>(
      init: GetMobileProductListVM(),
      builder: (value) {
        return GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            childAspectRatio: 2.0,
            mainAxisExtent: 230,
          ),
          itemCount: value.mobileList.length,
          itemBuilder: (context, index) {
            Product data = value.mobileList[index];
            return ProductTile(
              productInfo: data,
              addToCart: () {
                // print("${data.productName} is added to cart");
                addCartController.addToCart(data);
              },
            );
            // return Container(height: 400, width: 200, color: Colors.red);
          },
        );
      },
    );
  }
  
    Widget laptopView() {
    return GetBuilder<GetLaptopProductListVM>(
      init: GetLaptopProductListVM(),
      builder: (value) {
        return GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            childAspectRatio: 2.0,
            mainAxisExtent: 230,
          ),
          itemCount: value.laptopList.length,
          itemBuilder: (context, index) {
            Product data = value.laptopList[index];
            return ProductTile(
              productInfo: data,
              addToCart: () {
                // print("${data.productName} is added to cart");
                addCartController.addToCart(data);
              },
            );
            // return Container(height: 400, width: 200, color: Colors.red);
          },
        );
      },
    );
  }

}
