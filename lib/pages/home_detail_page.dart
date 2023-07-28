import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\₹${catalog.price}/-".text.bold.xl3.color(Colors.red).make(),
            Addtocart(
              catalog: catalog,
            ).wh(130, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: context.theme.canvasColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text
                      .color(context.theme.cardColor)
                      .lg
                      .xl4
                      .bold
                      .make(),
                  catalog.desc.text
                      .color(context.theme.cardColor)
                      .xl
                      .textStyle(context.captionStyle)
                      .make(),
                  30.heightBox,
                  '''Introducing the revolutionary product that will change your life forever! Say hello to the incredible ${catalog.name} Are you tired of dealing with everyday Are you tired of dealing with everyday hassles and inefficiencies? ${catalog.name} is here to save the day!  With its cutting-edge technology and sleek design, this product is a game-changer in the market.'''
                      .text
                      .color(context.theme.cardColor)
                      .textStyle(context.captionStyle)
                      .make()
                      .px16()
                ],
              ).py32(),
            ),
          ))
        ]),
      ).color(context.theme.cardColor),
    );
  }
}
