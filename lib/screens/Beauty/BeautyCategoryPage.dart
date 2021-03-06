import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/beauty_data_list.dart';
import 'package:plenty/screens/Home/HomePage.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class BeautyCategoryPage extends StatefulWidget {
  @override
  _BeautyCategoryPageState createState() => _BeautyCategoryPageState();
}

class _BeautyCategoryPageState extends State<BeautyCategoryPage>
    with SingleTickerProviderStateMixin {
  Size get _size => MediaQuery.of(context).size;

  double get _plentyItemWidth => _size.width / 2 + 48;
  ScrollController _plentyScrollController = ScrollController();
  ScrollController _plentyScrollController1 = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();

  int _plentyIndex = 0;
  List<Map<String, dynamic>> items = beautyStore[0]["item"];
  @override
  Widget build(BuildContext context) {
    _plentyScrollController.addListener(() {
      _backgroundScrollController.jumpTo(
          _plentyScrollController.offset * (_size.width / _plentyItemWidth));
    });
    /*    _plentyScrollController1.addListener(() {
      _backgroundScrollController.jumpTo(
          _plentyScrollController1.offset * (_size.width / _plentyItemWidth));
    }); */

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backgroundListView(),

          _beautyBody(),
          // _buyButton(context)
        ],
      ),
    );
  }

  Widget _backgroundListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: _backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: true,
      itemCount: beautyImgListVert.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Container(
          width: _size.width,
          height: _size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -_size.width / 2,
                right: -_size.width / 2,
                child: Image(
                  image: AssetImage(
                    beautyImgListVert[index],
                  ),
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
                        AppColors.plentyblue.withOpacity(.9)
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
        height: _size.height * .38,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ScrollSnapList(
            listController: _plentyScrollController,
            onItemFocus: (item) {
              items = beautyStore[item]["item"];
              setState(() {
                _plentyIndex = item;
              });
            },
            itemSize: _plentyItemWidth,
            //padding: EdgeInsets.zero,
            itemCount: beautyImgListVert.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _plentyItem(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _plentyListView1() {
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
        height: _size.height * .23,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ScrollSnapList(
            listController: _plentyScrollController1,
            onItemFocus: (item) {
              _plentyIndex = item;
            },
            itemSize: _plentyItemWidth,
            //padding: EdgeInsets.zero,
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _plentyItem1(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _plentyItem(int index) {
    return InkWell(
      /*    onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.topToBottom,
                duration: Duration(milliseconds: 500),
                child: BeautyStorePage()));
      }, */
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(
              beautyImgListVert[index],
            ),
            width: _size.width / 2,
            //   height: 250,
          ),
        ),
      ),
    );
  }

  Widget _plentyItem1(int index) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: AppColors.greyss, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(
                    items[index]["image"],
                  ),
                  width: _size.width / 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    itemTxt(items[index]["item_name"], 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: itemTxt(items[index]["item_desc"], 8),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  itemTxt('SAR ', 10),
                  itemTxt(items[index]["item_price"], 20),
                ],
              )
              /* ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: widget.plenty.restList[index].photo.image,
                  width: _size.width / 6,
                ),
              ),
              */
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: 15,
            left: 15,
            child: FittedBox(child: addToBasket(() {})))
      ],
    );
  }

  Widget _beautyBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
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
                          child: HomePage()));
                },
                child: Icon(
                  CupertinoIcons.chevron_left,
                  color: Colors.white,
                ),
              ),
              appBartxt('Beauty', 20),
              Icon(
                //CupertinoIcons.cart_badge_minus,
                Icons.shopping_basket_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(
              25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                homeWelcome1('Welcome Name, what are you in the mood for?', 15),
              ],
            )),
        _plentyListView(),
        Container(
            margin: const EdgeInsets.all(10),
            child: Divider(
              color: Colors.black,
              height: 10,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 15),
          child: homeWelcome2('Most Popular Items', 15),
        ),
        _plentyListView1()
      ],
    );
  }
}
