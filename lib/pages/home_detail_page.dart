import 'package:flutter/material.dart';
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
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(MyTheme.Color2),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: "Add to cart".text.xl.make()).wh(130, 50)
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
                  catalog.name.text.color(context.theme.cardColor).lg.xl4.bold.make(),
                  catalog.desc.text.color(context.theme.cardColor).xl.textStyle(context.captionStyle).make(),
                  30.heightBox,
                  "omkar If you're using Windows or Linux, the equivalent keyboard shortcut is Ctrl + Shift + V."
                  .text.color(context.theme.cardColor).textStyle(context.captionStyle).make().px16()
                ],
              ).py64(),
            ),
          ))
        ]),
      ).color(context.theme.cardColor),
    );
  }
}
