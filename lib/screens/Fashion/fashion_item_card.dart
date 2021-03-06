import 'package:flutter/material.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/fashion_product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),

              /* only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)) */
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      Icon(Icons.favorite_outline)
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  //padding: EdgeInsets.all(kDefaultPaddin),
                  // For  demo we use fixed height  and width
                  // Now we dont need them
                  height: 100,
                  //width: 160,
                  decoration: BoxDecoration(
                    //color: product.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(
                      product.image,
                    ),
                  ),
                ),
                itemTxt1(product.title, 20, AppColors.black, FontWeight.bold),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      itemTxt2('SAR ', 10),
                      itemTxt2("${product.price}", 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
