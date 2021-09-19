import 'package:flutter/material.dart';
import 'package:furniture/components/title_text.dart';
import 'package:furniture/screens/home/components/categories.dart';
import 'package:furniture/screens/home/components/recommended_products.dart';
import 'package:furniture/services/fetch_categories.dart';
import 'package:furniture/services/fetch_products.dart';
import 'package:furniture/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: "Browse by Categories",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data)
                  : Center(
                      child: Image.asset("assets/ripple.gif"),
                    ),
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(title: "Recommands For You"),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommendedProducts(products: snapshot.data)
                    : Center(
                        child: Image.asset("assets/ripple.gif"),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
