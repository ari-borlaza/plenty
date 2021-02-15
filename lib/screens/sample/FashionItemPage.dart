import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/fashion_data_list.dart';
import 'package:plenty/screens/Fashion/FashionCategoryPage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class FashionItemPage extends StatefulWidget {
  @override
  _FashionItemPageState createState() => _FashionItemPageState();
}

class _FashionItemPageState extends State<FashionItemPage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> items = fashionStore[0]["item"];
  List<Map<String, dynamic>> itemss = fashionStore[0]["item_price"];
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra.';
  String description1 = 'Lorem ipsum dolor sit amet';

  int _n = 0;
  bool selected = true;
  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  void add() {
    setState(() {
      _n++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _fashionBody()

        //_fashionBody(),
        );
  }

  Widget _fashionBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarr(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemTxt3("Title", 20),
                    itemTxt3("Description,Description,Description", 15),
                    SizedBox(
                      height: 10,
                    ),
                    itemTxt3("Select Size", 10),
                  ],
                ),
              ),
              swipey(),
              addOnsList()
              //addOnsList()
            ],
          ),
        ],
      ),
    );
  }

  Container addOnsList() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.txtfields,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemTxt3("Select Add Ons", 15),
          CheckboxGroup(
              activeColor: AppColors.sadagreen,
              labelStyle:
                  GoogleFonts.raleway(fontSize: 12, color: AppColors.black),
              labels: <String>[
                "Add On 1 (+SAR 1)",
                "Add On 2 (+SAR 1)",
                "Add On 3 (+SAR 1)",
                "Add On 4 (+SAR 1)",
                "Add On 5 (+SAR 1)",
                "Add On 6 (+SAR 1)",
                "Add On 7 (+SAR 1)",
              ],
              onSelected: (List<String> checked) => print(checked.toString())),
        ],
      ),
    );
  }

  Container swipey() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 375,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    itemTxt2('SAR ', 10),
                    itemTxt2(items[index]["item_price"], 20),
                  ],
                ),
                Container(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Y29mZmVlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                    /* 
                    items[index]["image"], */
                    fit: BoxFit.fill,
                    height: 180,
                  ),
                ),
                itemTxt2(items[index]["item_size"], 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        onPressed: minus,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        backgroundColor: AppColors.sadagreen),
                    itemTxt1('$_n', 40, AppColors.black, FontWeight.bold),
                    FloatingActionButton(
                      heroTag: null,
                      mini: true,
                      onPressed: add,
                      child: new Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: AppColors.sadagreen,
                    ),
                  ],
                ),
                plentyFlatBtn2('Add to basket', () {})
              ],
            ),
          );
        },
        itemCount: 3,
        viewportFraction: 0.8,
        scale: 0.8,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
        layout: SwiperLayout.DEFAULT,
        containerHeight: 500,
        itemHeight: 300,
        itemWidth: 300.0,
      ),
    );
  }

  Widget appBarr() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.sadagreen,
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1512151004335-d5b6c2ff7e12?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8Y29mZmVlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
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
                        child: FashionCategoryPage()));
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
}

class AddOns extends StatelessWidget {
  const AddOns({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        child: Card(
          color: AppColors.yellow,
          child: Text(
            '$title a long title',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
}
