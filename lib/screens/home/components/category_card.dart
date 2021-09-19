import 'package:flutter/material.dart';
import 'package:furniture/components/title_text.dart';
import 'package:furniture/constants.dart';
import 'package:furniture/models/categories.dart';
import 'package:furniture/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
        width: defaultSize * 20.5, // 205
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // This is custom Shape thats why we need to use ClipPath
              ClipPath(
                clipper: CategoryCustonShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title),
                        SizedBox(height: defaultSize),
                        Text(
                          "${category.numOfProducts} Products",
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: category.image,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustonShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    // bottom left
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height); // x1, y1, x2, y2
    // bottom right
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    // top right
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    // top left
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
