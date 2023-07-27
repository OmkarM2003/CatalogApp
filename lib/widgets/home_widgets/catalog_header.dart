import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Move CrossAxisAlignment here
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.Color2).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}
