import 'package:flutter/material.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemTxt4("Size:", 15, AppColors.black, FontWeight.bold),
        SizedBox(
          height: 15,
        ),
        itemTxt4("Select Color:", 15, AppColors.black, FontWeight.bold),
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
        SizedBox(
          height: 15,
        ),
        itemTxt4("Quantity:", 15, AppColors.black, FontWeight.bold),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            plentyFlatBtn6("Add to Bag", () {}, AppColors.black,
                AppColors.white, Icon(Icons.shopping_bag)),
            plentyFlatBtn6("Checkout", () {}, AppColors.white, AppColors.black,
                Icon(Icons.add_shopping_cart))
          ],
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
    return Stack(
      children: [
        Container(
          /*  margin: EdgeInsets.only(
            top: kDefaultPaddin / 4,
            right: kDefaultPaddin / 2,
          ), */
          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
          //padding: EdgeInsets.all(2.5),
          height: 35,
          width: 35,
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
        ),
        Positioned(
          top: 8,
          left: 4,
          child: isSelected
              ? Container(
                  alignment: Alignment.center,
                  width: 16,
                  height: 16,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green
                      /*  border: Border.all(
              color: isSelected ? color : Colors.transparent,
            ), */
                      ),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
