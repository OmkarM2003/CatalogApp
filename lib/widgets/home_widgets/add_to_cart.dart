import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class Addtocart extends StatefulWidget {
  final Item catalog;
  const Addtocart({
    super.key, required this.catalog,
  });

  @override
  State<Addtocart> createState() => AddtocartState();
}

class AddtocartState extends State<Addtocart> {

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog)?? false;
    return ElevatedButton(
        onPressed: () {
          if(!isInCart){
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(MyTheme.Color2),
            foregroundColor:
                MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus)
        );
  }
}