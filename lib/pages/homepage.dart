import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart'; // Import velocity_x
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

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
    await Future.delayed(Duration(seconds: 1));
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, snapshot, _) => FloatingActionButton(
            backgroundColor: context.theme.cardColor,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(CupertinoIcons.cart)
                .iconColor(context.theme.canvasColor)
                .iconSize(28),
          ).badge(
              color: Vx.red500,
              size: 23,
              count: _cart.items.length,
              textStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
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
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
