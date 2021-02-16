import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plenty/config/constants.dart';
import 'package:plenty/data/fashion_product.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.chevron_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite_border_outlined),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
