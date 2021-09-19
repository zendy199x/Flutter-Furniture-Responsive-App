import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture/models/product.dart';
import 'package:furniture/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  // That means I have to pass it
  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/bag.svg"),
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
