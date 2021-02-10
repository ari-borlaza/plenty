import 'package:flutter/material.dart';
import 'package:plenty/data/plenty_data.dart';
import 'package:plenty/widget/app_widget.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

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
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backgroundListView(),
          _plentyListView(),
          /*  _buyButton(context) */
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
                color: Colors.grey.withOpacity(.6),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.3),
                        Colors.black.withOpacity(.95)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.9]),
                ),
              ),
              /* Container(
                height: _size.height * .25,
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Align(
                  alignment: Alignment.center,
                  child: Image(
                    width: _size.width / 1.8,
                    image: _plentyData.plentyList[index].imageText.image,
                  ),
                ),
              ), */
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
    return Container(
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _size.width / 14,
                          fontWeight: FontWeight.w600),
                    ),
                    /*  SizedBox(
                      height: _size.height * .01,
                    ),
                    AppWidget.genresFormat(
                        _plentyData.plentyList[index].genre, Colors.white),
                    SizedBox(
                      height: _size.height * .01,
                    ),
                    Text(
                      _plentyData.plentyList[index].rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _size.width / 16,
                      ),
                    ),
                    SizedBox(
                      height: _size.height * .005,
                    ),
                    AppWidget.starRating(_plentyData.plentyList[index].rating) */
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
    );
  }

/*   Widget _buyButton(BuildContext context) {
    return Container(
      height: _size.height * .10,
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Align(
        alignment: Alignment.topCenter,
        child: FlatButton(
          color: AppColor.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            /*  Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (ctx, a1, a2) => DetailScreen(
                  plenty: _plentyData.plentyList[_plentyIndex],
                  size: _size,
                ),
              ),
            ); */
          },
          child: Container(
            width: double.infinity,
            height: _size.height * .08,
            child: Center(
              child: Text(
                'Buy Ticket',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  } */

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
}
