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
      appBar: AppBar(),
      backgroundColor: MyTheme.Color3,
      bottomNavigationBar: Container(
        color: Colors.white,
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
                child: "Buy".text.xl.make()).wh(100, 50)
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
              color: Colors.white,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.lg.xl4.bold.make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  30.heightBox,
                ],
              ).py64(),
            ),
          ))
        ]),
      ).color(Color.fromARGB(255, 213, 208, 208)),
    );
  }
}
