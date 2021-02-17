import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/config/utils.dart';
import 'package:plenty/data/fashion_data_list.dart';
import 'package:plenty/data/fashion_product.dart';
import 'package:plenty/screens/Home/HomePage.dart';

class MyBag extends StatefulWidget {
   final Product product;

  const MyBag({Key key, this.product}) : super(key: key);
  @override
  _MyBagState createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  List<Map<String, dynamic>> items = fashionStore[0]["item"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: ContestTabHeader(
                appBarr(),
              ),
            ),
          ];
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Expanded(
                child: LiveList(
              showItemInterval: Duration(milliseconds: 150),
              showItemDuration: Duration(milliseconds: 350),
              padding: EdgeInsets.all(16),
              reAnimateOnVisibility: true,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: animationItemBuilder(
                (index) => bagList(index),
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
            )),
            subTotal("Subtotal"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: plentyFlatBtn4("Checkout".toUpperCase(), () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget subTotal(String txt) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.txtfields,
        //borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeChoose(txt, 15),
          homeChoose(txt, 15),
        ],
      ),
    );
  }

  Widget appBarr() {
    return Container(
      //height: 10,
      decoration: BoxDecoration(
        //  color: AppColors.sadagreen,
        image: DecorationImage(
          image: AssetImage('assets/image/Store Banner.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 500),
                            child: HomePage()));
                  },
                  child: Icon(
                    CupertinoIcons.chevron_left,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                homeChoose('My Bag', 20),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Image.asset('assets/icons/Bag.png'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bagList(int index) {
    var product;
    return InkWell(
      onTap: () {
        /*   Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.topToBottom,
                duration: Duration(milliseconds: 500),
                child: FoodItemPage())); */
      },
      child: Container(
        height: 112,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemTxt2(product.title, 15),
                    itemTxt2(items[index]["item_desc"], 8),
                    Row(
                      children: [
                        itemTxt2('SAR ', 10),
                        itemTxt2(items[index]["item_price"], 20),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 75,
                  height: 75,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage(
                          items[index]["image"],
                        ),
                        fit: BoxFit
                            .cover, /* 
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.9), BlendMode.lighten), */
                      )),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.appBarr,
  );
  final Widget appBarr;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return appBarr;
  }

  @override
  double get maxExtent => 125.0;

  @override
  double get minExtent => 125.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
