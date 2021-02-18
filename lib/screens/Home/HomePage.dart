import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/plenty_data.dart';
import 'package:plenty/screens/Home/RewardCard.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var _plentyData = PlentyData();

  Size get _size => MediaQuery.of(context).size;

  double get _plentyItemWidth => _size.width / 2 + 48;
  ScrollController _plentyScrollController = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();
  double _maxPlentyTranslate = 65;
  int _plentyIndex = 0;

  @override
  Widget build(BuildContext context) {
    _plentyScrollController.addListener(() {
      _backgroundScrollController.jumpTo(
          _plentyScrollController.offset * (_size.width / _plentyItemWidth));
    });

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backgroundListView(),
          _homeHeader(),
          Stack(
            children: [
              Positioned(
                  top: 100,
                  right: -1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          print('clicked my bag');
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                'assets/icons/Bag.png',
                                color: AppColors.plentyblue1,
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.plentyblue1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: 50,
                              height: 40,
                            ),
                            itemTxt1("My Bag", 12, AppColors.plentyblue1,
                                FontWeight.normal),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('clicked my fave');
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Image.asset(
                                'assets/icons/Fav.png',
                                color: AppColors.plentyblue1,
                              ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.plentyblue1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: 50,
                              height: 40,
                            ),
                            itemTxt1("Favorite", 12, AppColors.plentyblue1,
                                FontWeight.normal),
                          ],
                        ),
                      ),
                      /*  InkWell(
                        onTap: () {
                          print('clicked plenty');
                        },
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                              child: Image.asset(
                                'assets/icons/P.png',
                                color: AppColors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.plentyblue1,
                                  border:
                                      Border.all(color: AppColors.plentyblue1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  )),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: 50,
                              height: 40,
                            ),
                            itemTxt1("Plenty", 12, AppColors.plentyblue1,
                                FontWeight.normal),
                          ],
                        ),
                      ), */
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: InkWell(
                          onTap: () {
                            print('clicked my Access');
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Shimmer.fromColors(
                                    // direction: ShimmerDirection.btt,
                                    baseColor: AppColors.gold1,
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Container(
                                      width: 128,
                                      height: 46,
                                      decoration: BoxDecoration(
                                          color: AppColors.gold,
                                          /* border: Border.all(
                                              color: AppColors.plentyblue1), */
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: itemTxt1(
                                        "My Access",
                                        12,
                                        AppColors.plentyblue1,
                                        FontWeight.normal),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: -2,
                                right: 0,
                                child: Container(
                                  /* 
                                          child: Image.asset(
                                            'assets/icons/P.png',
                                            color: AppColors.white,
                                          ), */
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: AppColors.gold1,
                                      /*  border: Border.all(
                                                  color: AppColors.plentyblue1), */
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  width: 125,
                                  height: 40,
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  child: Icon(Icons.card_giftcard,
                                      color: AppColors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          _plentyListView(),
        ],
      ),
    );
  }

  Widget _backgroundListView() {
    return ListView.builder(
      controller: _backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: true,
      itemCount: _plentyData.plentyList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Container(
          width: _size.width,
          height: _size.height,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Image(
                image: _plentyData.plentyList[index].image1.image,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.white.withOpacity(.4),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.plentyblue.withOpacity(.8),
                        Colors.white.withOpacity(.1),
                        Colors.white.withOpacity(.95)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.9]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _plentyListView() {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: Container(
            height: _size.height * .6,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return true;
              },
              child: ScrollSnapList(
                listController: _plentyScrollController,
                onItemFocus: (item) {
                  _plentyIndex = item;
                },
                itemSize: _plentyItemWidth,
                padding: EdgeInsets.zero,
                itemCount: _plentyData.plentyList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _plentyItem(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _plentyItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.topToBottom,
              duration: Duration(milliseconds: 500),
              child: _plentyData.plentyList[index].link,
            ));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 40),
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AnimatedBuilder(
              animation: _plentyScrollController,
              builder: (context, child) {
                double activeOffset = index * _plentyItemWidth;
                double opacity = _plentyDescriptionOpacity(
                    _plentyScrollController.offset, activeOffset);

                return Opacity(
                  opacity: opacity / 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        _plentyData.plentyList[index].category,
                        style: GoogleFonts.oswald(
                            color: AppColors.plentyblue,
                            fontSize: _size.width / 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _plentyScrollController,
              builder: (ctx, child) {
                double activeOffset = index * _plentyItemWidth;

                double translate = _plentyTranslate(
                    _plentyScrollController.offset, activeOffset);

                return SizedBox(
                  height: translate,
                );
              },
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: _plentyData.plentyList[index].image.image,
                //height: 350,
                width: _size.width / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _plentyDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (_plentyScrollController.offset + _plentyItemWidth <= activeOffset) {
      opacity = 0;
    } else if (_plentyScrollController.offset <= activeOffset) {
      opacity = ((_plentyScrollController.offset -
              (activeOffset - _plentyItemWidth)) /
          _plentyItemWidth *
          100);
    } else if (_plentyScrollController.offset <
        activeOffset + _plentyItemWidth) {
      opacity = 100 -
          (((_plentyScrollController.offset -
                      (activeOffset - _plentyItemWidth)) /
                  _plentyItemWidth *
                  100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  double _plentyTranslate(double offset, double activeOffset) {
    double translate;
    if (_plentyScrollController.offset + _plentyItemWidth <= activeOffset) {
      translate = _maxPlentyTranslate;
    } else if (_plentyScrollController.offset <= activeOffset) {
      translate = _maxPlentyTranslate -
          ((_plentyScrollController.offset -
                  (activeOffset - _plentyItemWidth)) /
              _plentyItemWidth *
              _maxPlentyTranslate);
    } else if (_plentyScrollController.offset <
        activeOffset + _plentyItemWidth) {
      translate = ((_plentyScrollController.offset -
                  (activeOffset - _plentyItemWidth)) /
              _plentyItemWidth *
              _maxPlentyTranslate) -
          _maxPlentyTranslate;
    } else {
      translate = _maxPlentyTranslate;
    }
    return translate;
  }

  Widget _homeHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    homeWelcome3('Welcome, Name', 20, () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.topToBottom,
                              duration: Duration(milliseconds: 1000),
                              child: Rewards()));
                    }),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 1000),
                            child: Rewards()));
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.only(left: 50, top: 30),
            child: homeChoose1('Choose your', 30)),
        Container(
            padding: EdgeInsets.only(
              left: 50,
            ),
            child: homeChoose1('Experience', 30)),
        Container(
            margin: const EdgeInsets.only(left: 40.0, right: 150.0),
            child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 10,
            )),
      ],
    );
  }
}
