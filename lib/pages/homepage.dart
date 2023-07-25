import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

// ignore: camel_case_types
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text("Catalog App",
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
      ),
      body: Center(
        child: Container(
          child: const Text("Welcome to App"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
