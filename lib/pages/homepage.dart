import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/driverinfo.dart';
import 'package:velocity_x/velocity_x.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
// Move CrossAxisAlignment here
        children: [
          Container(
              padding: EdgeInsetsDirectional.only(top: 35),
              child: "TrashPick"
                  .text
                  .xl5
                  .bold
                  .color(context.theme.cardColor)
                  .make()),
          Container(
            height: 250,
            width: 100,
            child: Image.asset("assets/imgs/img.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsetsDirectional.all(25),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: context.theme.cardColor),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: context.theme.canvasColor,
                      size: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Track Trash Vehicle",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: context.theme.canvasColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsetsDirectional.all(25),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: context.theme.cardColor),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_3_rounded,
                      color: context.theme.canvasColor,
                      size: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Driver's Info",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: context.theme.canvasColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DriverInfo()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsetsDirectional.all(25),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: context.theme.cardColor),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      color: context.theme.canvasColor,
                      size: 35,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Register A Complaint",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: context.theme.canvasColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
