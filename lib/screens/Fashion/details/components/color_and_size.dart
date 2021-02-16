import 'package:flutter/material.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/constants.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/fashion_product.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                itemTxt2('Color: ', 15),
                Row(
                  children: <Widget>[
                    ColorDot(
                      color: Color(0xFF356C95),
                      isSelected: true,
                    ),
                    ColorDot(color: Color(0xFFF8C078)),
                    ColorDot(color: Color(0xFFA29B9B)),
                  ],
                ),
              ],
            ),
            itemTxt2('\Size: ${product.size} cm', 20),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            itemTxt2('Designer: ', 15),
            itemTxt2('${product.designer}', 20),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: plentyFlatBtn4("View Designers Products", () {}),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
