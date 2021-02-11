import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/config/utils.dart';
import 'package:plenty/data/food1_list_data.dart';
import 'package:plenty/data/food_data_list.dart';
import 'package:plenty/data/plenty_data.dart';
import 'package:plenty/screens/Food/FoodCategoryPage.dart';
import 'package:plenty/screens/Home/HomePage.dart';

class FoodStorePage extends StatefulWidget {
  PlentyModel plenty;

  @override
  _FoodStorePageState createState() => _FoodStorePageState();
}

class _FoodStorePageState extends State<FoodStorePage>
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _foodBody(),
        ],
      ),
    );
  }

  Widget _foodBody() {
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
                              color: Colors.yellow,
                              image: DecorationImage(
                                image: AssetImage('assets/image/food.jpeg'),
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
                      foodTab(),
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
                      HomePage(),
                      HomePage(),
                      HomePage(),
                      HomePage(),
                    ],
                  ),
                ),
              )

              /*  Container(
              child: ListView.builder(
                itemCount: foodList.length,
                padding: const EdgeInsets.only(top: 8),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final int count = foodList.length > 10 ? 10 : foodList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();
                  return FoodListView(
                    callback: () {},
                    foodData: foodList[index],
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
                        child: FoodCategoryPage()));
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
          indicatorColor: AppColors.red,
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
      itemCount: 20,
      itemBuilder: animationItemBuilder(
        (index) => FoodItem(title: index.toString()),
        padding: EdgeInsets.symmetric(vertical: 8),
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

class FoodItem extends StatelessWidget {
  const FoodItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        height: 96,
        child: Card(
          color: AppColors.yellow,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.9), BlendMode.lighten),
                    )),
              ),
              Text(
                '$title a long title',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
}
