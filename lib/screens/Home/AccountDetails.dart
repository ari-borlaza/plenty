import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getwidget/getwidget.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/screens/Home/AccountDetails.dart';
import 'package:plenty/screens/Home/HomePage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:plenty/screens/Home/RewardCard.dart';

import 'package:sign_button/sign_button.dart';

class AccountDetails extends StatefulWidget {
  final String txt;

  const AccountDetails({Key key, this.txt}) : super(key: key);
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  List<String> txt = ['Full Name', 'Email Address', 'Mobile Number'];
  TextEditingController bday = TextEditingController();
  List<String> list1 = [
    'Account Details',
    'Contact Us',
    'Change Language',
    'My Favorite',
  ];

  List<Icon> icons1 = [
    Icon(
      Icons.account_circle,
      color: AppColors.black,
    ),
    Icon(
      Icons.mail,
      color: AppColors.black,
    ),
    Icon(
      Icons.g_translate,
      color: AppColors.black,
    ),
    Icon(
      LineIcons.heart,
      color: AppColors.black,
    ),
  ];
  List<dynamic> links1 = [
    AccountDetails(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  List gender = ["Male", "Female", "Other"];

  String select;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //height: 100,
                decoration: BoxDecoration(
                  color: AppColors.sadagreen,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://thumbs.dreamstime.com/b/arabesque-star-pattern-light-grey-background-vector-illustration-48711651.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                      child: Rewards()));
                            },
                            child: Icon(
                              CupertinoIcons.chevron_left,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                homeChoose('Account Details', 20),
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
                  ],
                ),
              ),
              SizedBox(height: 10),
              ...txt
                  .map((e) => TField(
                        txt: e,
                      ))
                  .toList(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeChoose('Birth of Date', 15),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: bday,
                      onTap: () {
                        DatePicker.showPicker(
                          context,
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date in time zone ' +
                                date.timeZoneOffset.inHours.toString());
                          },
                          onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              bday.text = date.toString().split(" ")[0];
                            });
                          },
                        );
                      },
                      style: GoogleFonts.markaziText(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.markaziText(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.white),
                        //hintText: widget.txt,
                        filled: true,
                        fillColor: AppColors.txtfields,
                        contentPadding: const EdgeInsets.only(
                            left: 10.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    homeChoose('Gender', 15),
                    Row(
                      children: <Widget>[
                        addRadioButton(0, 'Male'),
                        addRadioButton(1, 'Female'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/* 
  FlatButton datePickBtn(BuildContext context) {
    return FlatButton(
        onPressed: () {
          DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            },
            onConfirm: (date) {
              print('confirm $date');
            },
          );
        },
        child: Icon(Icons.arrow_drop_down));
  } */

  Padding titleTxt(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          homeChoose(txt, 15),
        ],
      ),
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        homeChoose(title, 15),
      ],
    );
  }
}

class TField extends StatefulWidget {
  TField({Key key, this.txt}) : super(key: key);
  final String txt;
  @override
  _TFieldState createState() => _TFieldState();
}

class _TFieldState extends State<TField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeChoose(widget.txt, 15),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: TextFormField(
              style: GoogleFonts.markaziText(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.black),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.markaziText(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
                //hintText: widget.txt,
                filled: true,
                fillColor: AppColors.txtfields,
                contentPadding:
                    const EdgeInsets.only(left: 10.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
