import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/constants.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/config/utils.dart';
import 'package:plenty/data/fashion_product.dart';
import 'package:plenty/screens/Fashion/details/details_screen.dart';
import 'package:plenty/screens/Fashion/fashion_item_card.dart';
import 'package:plenty/screens/Food/FoodCategoryPage.dart';
import 'fashion_categories.dart';

class FashionBody extends StatefulWidget {
  FashionBody({Key key}) : super(key: key);

  @override
  _FashionBodyState createState() => _FashionBodyState();
}

class _FashionBodyState extends State<FashionBody> {
  int itemsCount = products.length;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500) * 5, () {
      if (!mounted) {
        return;
      }
      setState(() {
        itemsCount += 10;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        appBarr(),
        Categories(),
        gridProducts(context),
      ],
    );
  }

  Widget gridProducts(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: LiveGrid(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            childAspectRatio: 0.75,
          ),
          itemBuilder: animationItemBuilder(
            (index) => ItemCard(
              product: products[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarr() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.sadagreen,
        image: DecorationImage(
          image: NetworkImage(
              'https://thumbs.dreamstime.com/b/arabesque-star-pattern-light-grey-background-vector-illustration-48711651.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 500),
                        child: FoodCategoryPage()));
              },
              child: Icon(
                CupertinoIcons.chevron_left,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  appBartxt1('Store 1 Tagline', 8),
                ],
              ),
            ),
            Icon(
              Icons.attribution_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
