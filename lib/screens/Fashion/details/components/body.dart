import 'package:flutter/material.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/constants.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/fashion_product.dart';
import 'color_and_size.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProductTitleWithImage(product: product),
          Container(
            // margin: EdgeInsets.only(top: size.height * 0.3),
            padding: EdgeInsets.only(
              top: size.height * 0.03,
              bottom: size.height * 0.03,
              left: kDefaultPaddin,
              right: kDefaultPaddin,
            ),
            // height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              /*  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ), */
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                itemTxt1(product.title, 30, AppColors.black, FontWeight.bold),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    itemTxt1(product.description, 15, AppColors.grey,
                        FontWeight.bold),
                    itemTxt2('\SAR ${product.price}', 20),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ColorAndSize(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
