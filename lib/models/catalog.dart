class CatalogModel {
  static final items = [
    Item(
      id: "01",
      name: "Iphone 12 Pro",
      desc: "Apple Iphone 12th generation",
      price: 149999,
      color: "#33505a",
      image:
          "https://images.hindustantimes.com/tech/htmobile4/P34241/images/Design/136139-v4-apple-iphone-12-mobile-phone-large-5.jpg",
    ),
    Item(
      id: "02",
      name: "Google Pixel 6",
      desc: "Google's Latest Phone",
      price: 45999,
      color: "#33505a",
      image:
          "https://cdn1.smartprix.com/rx-iHkpHY9pu-w1200-h1200/HkpHY9pu.jpg",
    )
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}
