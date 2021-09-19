import 'package:flutter/material.dart';
import 'package:furniture/screens/details/details_screen.dart';
import 'package:furniture/screens/home/components/product_card.dart';
import 'package:furniture/size_config.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  // Because our API provie us list of products
  final dynamic products; // type List<Product>

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        // I just turn of grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  product: products[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
