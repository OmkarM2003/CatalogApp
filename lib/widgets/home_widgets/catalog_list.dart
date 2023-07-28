import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        // Use the ValueKey to uniquely identify each CatalogItem
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                key: ValueKey(catalog.id), // Provide a unique key here
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(
            key: ValueKey(catalog.id),
            catalog: catalog,
          ),
        );
      },
    ): ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        // Use the ValueKey to uniquely identify each CatalogItem
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                key: ValueKey(catalog.id), // Provide a unique key here
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(
            key: ValueKey(catalog.id),
            catalog: catalog,
          ),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required Key key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.color(context.theme.cardColor).lg.bold.make(),
            catalog.desc.text
                .color(context.theme.cardColor)
                .textStyle(context.captionStyle)
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\₹${catalog.price}"
                    .text
                    .color(context.theme.cardColor)
                    .bold
                    .make(),
                Addtocart(catalog:catalog)
              ],
            ).pOnly(right: 10.0)
          ],
        ))
      ],
    )).color(context.theme.highlightColor).rounded.square(150).make().py16();
  }
}


