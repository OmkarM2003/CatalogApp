import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: "Cart".text.color(context.theme.cardColor).make(),
      ),
      body: Column(
        children: [
          cartlist().p32().expand(),
          Divider(),
          cartTotal(),
        ],
      ),
    );
  }
}

class cartTotal extends StatelessWidget {
  const cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\₹${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.cardColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Your Purchase is Successful".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.cardColor)),
            child: "Buy".text.xl2.bold.color(context.theme.canvasColor).make(),
          ).wh(130, 50)
        ],
      ),
    );
  }
}

class cartlist extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.xl3.color(context.theme.cardColor).makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    Icons.done,
                    color: context.theme.cardColor,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: context.theme.cardColor,
                    ),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                    },
                  ),
                  title: _cart.items[index].name.text
                      .color(context.theme.cardColor)
                      .make(),
                ));
  }
}
