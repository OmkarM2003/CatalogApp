import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Move CrossAxisAlignment here
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.cardColor).make(),
        "Trending Products".text.xl2.color(context.theme.cardColor).make()
      ],
    );
  }
}
