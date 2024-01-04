class Product {
  String id;
  String productName;
  String productPrice;
  String productImgPath;

  Product(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.productImgPath});

  static List<Product> get getMobileList => mobileDataList;
  static List<Product> get getLaptopList => laptopDataList;

  // List<Product> get getLaptopsList {
  //   return mobileDataList;
  // }

  static List<Product> laptopDataList = [
    Product(
      id: "laptop_01", 
      productName: "ASUS ROG", 
      productPrice: "92,000", 
      productImgPath: "assets/laptop1.png"
      ),
    Product(
      id: "laptop_02", 
      productName: "Mackbook", 
      productPrice: "99,000", 
      productImgPath: "assets/laptop2.png"
      ),
    Product(
      id: "laptop_03", 
      productName: "Custom", 
      productPrice: "56,000", 
      productImgPath: "assets/laptop3.png"
      ),
    Product(
      id: "laptop_04", 
      productName: "Samsung", 
      productPrice: "67,000", 
      productImgPath: "assets/laptop4.png"
      ),
    Product(
      id: "laptop_05", 
      productName: "DELL Monitor", 
      productPrice: "37,000", 
      productImgPath: "assets/monitor.png"
      )
  ];

  static List<Product> mobileDataList = [
    Product(
        id: "mob_1",
        productName: "Samsung 21fe",
        productPrice: "32,0000",
        productImgPath: "assets/samsung_s21.webp"),
    Product(
        id: "mob_2",
        productName: "Samsung A50",
        productPrice: "20,0000",
        productImgPath: "assets/samsung_a50.webp"),
    Product(
        id: "mob_3",
        productName: "OnePlus 9",
        productPrice: "31,0000",
        productImgPath: "assets/oneplus_9.jpg"),
    Product(
        id: "mob_4",
        productName: "Sony",
        productPrice: "30,0000",
        productImgPath: "assets/sony.png"),
    Product(
        id: "mob_5",
        productName: "Sony L2",
        productPrice: "44,0000",
        productImgPath: "assets/sonyl2.png"),
  ];
}
