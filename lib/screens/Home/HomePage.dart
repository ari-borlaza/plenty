import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/plenty_data.dart';
import 'package:plenty/screens/Home/RewardCard.dart';
import 'package:plenty/screens/sample/bgvid.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:video_player/video_player.dart';

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
  VideoPlayerController _controller;
  double _maxPlentyTranslate = 65;
  int _plentyIndex = 0;

  @override
  Widget build(BuildContext context) {
    _plentyScrollController.addListener(() {
      _backgroundScrollController.jumpTo(
          _plentyScrollController.offset * (_size.width / _plentyItemWidth));
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backgroundListView(),
          _homeHeader(),
          _plentyListView(),
          // BackgroundVideo()
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
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -_size.width / 3,
                right: -_size.width / 3,
                child: Image(
                  image: _plentyData.plentyList[index].image.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white.withOpacity(.6),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.plentyblue.withOpacity(.9),
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
          child: child,
        );
      },
      child: Container(
        height: _size.height * .75,
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
            SizedBox(
              height: _size.height * .02,
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
          height: 70,
          //  color: Colors.green,
        ),
        Container(
            padding: EdgeInsets.all(
              25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    homeWelcome3('Welcome, Name', 30, () {Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 1000),
                                child: Rewards()));}),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
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
      ],
    );
  }
}
