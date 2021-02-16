import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/constants.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/config/utils.dart';
import 'package:plenty/data/fashion_data_list.dart';
import 'package:plenty/data/fashion_product.dart';
import 'package:plenty/screens/Fashion/FashionCategoryPage.dart';
import 'package:plenty/screens/Food/FoodCategoryPage.dart';
import 'package:plenty/screens/Home/HomePage.dart';

import 'details/details_screen.dart';
import 'fashion_item_card.dart';

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
          FashionBody(),
        ],
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

class FashionBody extends StatefulWidget {
  FashionBody({Key key}) : super(key: key);

  @override
  _FashionBodyState createState() => _FashionBodyState();
}

class _FashionBodyState extends State<FashionBody>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<Map<String, dynamic>> items = fashionStore[0]["item"];
  List<Tab> tabList = List();
  TabController _tabController;
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra.';
  String description1 = 'Lorem ipsum dolor sit amet';
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
    tabList.add(new Tab(
      text: 'Dress',
    ));
    tabList.add(new Tab(
      text: 'Tops',
    ));
    tabList.add(new Tab(
      text: 'Bottoms',
    ));
    tabList.add(new Tab(
      text: 'Skirt',
    ));
    tabList.add(new Tab(
      text: 'Pants',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int itemsCount = products.length;

  Widget fashionTab() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: new BoxDecoration(color: AppColors.white),
      child: new TabBar(
          labelStyle: GoogleFonts.cabin(
            fontSize: 18,
          ),
          labelColor: AppColors.plentyblue,
          unselectedLabelColor: AppColors.semiGrey,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: AppColors.plentyblue,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        appBarr(),
        Expanded(
          child: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              gridProducts(context),
              gridProducts(context),
              gridProducts(context),
              gridProducts(context),
              gridProducts(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget gridProducts(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LiveGrid(
          reAnimateOnVisibility: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 15,
            childAspectRatio: 0.8,
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
        // color: AppColors.sadagreen,
        image: DecorationImage(
          image: AssetImage('assets/image/Store Banner.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          Padding(
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
          fashionTab(),
        ],
      ),
    );
  }
}
