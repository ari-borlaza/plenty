import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/config/utils.dart';
import 'package:plenty/data/food1_list_data.dart';
import 'package:plenty/data/food_data_list.dart';
import 'package:plenty/screens/Food/FoodCategoryPage.dart';
import 'package:plenty/screens/Home/HomePage.dart';

class FoodItemPage extends StatefulWidget {
  @override
  _FoodItemPageState createState() => _FoodItemPageState();
}

class _FoodItemPageState extends State<FoodItemPage>
    with SingleTickerProviderStateMixin {
  Size get _size => MediaQuery.of(context).size;

  double get _plentyItemWidth => _size.width / 2 + 48;
  ScrollController _plentyScrollController = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();

  AnimationController animationController;
  List<FoodListData> foodList = FoodListData.foodList;
  List<Map<String, dynamic>> items = foodStore[0]["item"];
  List<Tab> tabList = List();
  TabController _tabController;
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra.';
  String description1 = 'Lorem ipsum dolor sit amet';
  @override
  void initState() {
    tabList.add(new Tab(
      text: 'Coffeeee 1',
    ));
    tabList.add(new Tab(
      text: 'Coffeeee 2',
    ));
    tabList.add(new Tab(
      text: 'Coffeeee 3',
    ));
    tabList.add(new Tab(
      text: 'Coffeeee 4',
    ));
    tabList.add(new Tab(
      text: 'Coffeeee 5',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _plentyScrollController.addListener(() {
      _backgroundScrollController.jumpTo(
          _plentyScrollController.offset * (_size.width / _plentyItemWidth));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: _foodBody(),
    );
  }

  Widget _foodBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBarr(),
        
      ],
    );
  }

  Widget appBarr() {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: AppColors.sadagreen,
        image: DecorationImage(
          image: AssetImage('assets/image/food.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                color: Colors.white,
              ),
            ),
            Icon(
              //CupertinoIcons.cart_badge_minus,
              Icons.shopping_basket_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget foodTab() {
    return Container(
      decoration: new BoxDecoration(color: AppColors.sadagreen),
      child: new TabBar(
          labelStyle: GoogleFonts.cabin(
            fontSize: 18,
          ),
          labelColor: AppColors.txtfields,
          unselectedLabelColor: AppColors.white,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: AppColors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabList),
    );
  }

  itemList() {
    return LiveList(
      showItemInterval: Duration(milliseconds: 150),
      showItemDuration: Duration(milliseconds: 350),
      padding: EdgeInsets.all(16),
      reAnimateOnVisibility: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: animationItemBuilder(
        (index) => itemTile(index),
        padding: EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }

  Widget itemTile(int index) {
    return Container(
      height: 96,
      child: Card(
        shadowColor: AppColors.greyss,
        elevation: 5,
        //color: AppColors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 100,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemTxt2(items[index]["item_name"], 15),
                itemTxt2(items[index]["item_desc"], 8),
                Row(
                  children: [
                    itemTxt2('SAR ', 10),
                    itemTxt2(items[index]["item_price"], 20),
                  ],
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: plentyFlatBtn2('Add to basket', () {}))
          ],
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.foodTab,
  );
  final Widget foodTab;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return foodTab;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
