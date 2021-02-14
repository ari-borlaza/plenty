import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/config/utils.dart';
import 'package:plenty/data/fashion_data_list.dart';
import 'package:plenty/screens/Fashion/FashionCategoryPage.dart';
import 'package:plenty/screens/Fashion/FashionItemPage.dart';
import 'package:plenty/screens/Home/HomePage.dart';

class FashionStorePage extends StatefulWidget {
  @override
  _FashionStorePageState createState() => _FashionStorePageState();
}

class _FashionStorePageState extends State<FashionStorePage>
    with SingleTickerProviderStateMixin {
  Size get _size => MediaQuery.of(context).size;

  double get _plentyItemWidth => _size.width / 2 + 48;
  ScrollController _plentyScrollController = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();

  AnimationController animationController;
  List<Map<String, dynamic>> items = fashionStore[0]["item"];
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _fashionBody(),
        ],
      ),
    );
  }

  Widget _fashionBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appBarr(),

        /*      Container(
          padding: EdgeInsets.all(
            25,
          ),
        ),
        //  _plentyListView(),
        Container(
            margin: const EdgeInsets.all(30),
            child: Divider(
              color: Colors.black,
              height: 10,
            )), */
        Expanded(
          child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              image: DecorationImage(
                                image: AssetImage('assets/image/fashion.jpeg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      );
                    }, childCount: 1),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: ContestTabHeader(
                      fashionTab(),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
                  height: 600.0,
                  child: new TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      itemList(),
                      itemList(),
                      itemList(),
                      itemList(),
                      itemList()
                    ],
                  ),
                ),
              )

              /*  Container(
              child: ListView.builder(
                itemCount: fashionList.length,
                padding: const EdgeInsets.only(top: 8),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final int count = fashionList.length > 10 ? 10 : fashionList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();
                  return FashionListView(
                    callback: () {},
                    fashionData: fashionList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ), */
              ),
        )

        /*     Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 25),
          child: homeWelcome2('Most Popular Items', 15),
        ), */
        // _plentyListView1()

        ,
        Container(
          color: AppColors.white,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.txtfields,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_basket_outlined, color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    itemTxt1('View Basket', 14, AppColors.greysss,
                        FontWeight.normal),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    itemTxt1('Total', 15, AppColors.black, FontWeight.bold),
                    SizedBox(
                      width: 10,
                    ),
                    itemTxt1('SAR #', 15, AppColors.black, FontWeight.bold),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget appBarr() {
    return Container(
      color: AppColors.sadagreen,
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
                        child: FashionCategoryPage()));
              },
              child: Icon(
                CupertinoIcons.chevron_left,
                color: Colors.white,
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
                  appBartxt('Store 1 Tagline', 8),
                ],
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

  Widget fashionTab() {
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.topToBottom,
                duration: Duration(milliseconds: 500),
                child: FashionItemPage()));
      },
      child: Container(
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
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.fashionTab,
  );
  final Widget fashionTab;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return fashionTab;
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
