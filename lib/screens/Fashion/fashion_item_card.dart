import 'package:flutter/material.dart';
import 'package:plenty/config/constants.dart';
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
        children: <Widget>[
          Card(
            elevation: 5,
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
                  height: 115,
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
                Text(
                  // products is out demo list
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "\SAR ${product.price}",
                      ),
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
