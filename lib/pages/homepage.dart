import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/themes.dart'; // Import velocity_x
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.Color3,
        body: SafeArea(
          // ignore: avoid_unnecessary_containers
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 25, horizontal: 25), // Use Vx.m32 for padding
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Move CrossAxisAlignment here
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Move CrossAxisAlignment here
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontSize: 25,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            color: MyTheme.Color1,
          ),
        ),
        Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 15,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        // Use the ValueKey to uniquely identify each CatalogItem
        return CatalogItem(
          key: ValueKey(catalog
              .id), // Assuming 'id' is a unique identifier in the catalog item
          catalog: catalog,
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
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.make(),
              catalog.desc.text.make(),
              30.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\₹${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(MyTheme.Color2),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(StadiumBorder())
                      ), 
                    child: "Buy".text.make())
                ],
              ).pOnly(right:10.0)
            ],
          ))
        ],
      )
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});
  

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.color(MyTheme.Color3).make().p16().w40(context);
  }
}


