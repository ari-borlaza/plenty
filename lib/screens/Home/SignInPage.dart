import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/data/food_data_list.dart';
import 'package:plenty/screens/Home/HomePage.dart';
import 'package:plenty/screens/Home/OTPnumber.dart';
import 'package:sign_button/sign_button.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle, String pagetitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(foodImgListVert1[0]),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.lighten),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            //margin: EdgeInsets,
            padding: EdgeInsets.only(
              right: 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                logWelcome1('Welcome', 25),
                logWelcome1('Please Sign in to continue', 15),
              ],
            ),
          ),
          Container(
            width: 250,
            height: 170,
            //  margin: EdgeInsets.all(),
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage('assets/icons/Plenty Logo.png'),
                  fit: BoxFit
                      .fill, /* 
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9), BlendMode.lighten), */
                )),
          ),
          plentyTextInput('E-mail'),
          plentyPasswordInput('Password'),
          Container(
            width: 300,
            //padding: EdgeInsets.only(bottom: 5, top: 5),
            child: plentyFlatBtn('LOGIN', () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(milliseconds: 500),
                      child: HomePage()));
            }),
          ),
          Container(
            width: 300,
            child: plentyOutlineBtn('REGISTER', () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(milliseconds: 500),
                      child: OTPnumber()));
            }),
          ),
          Container(
            // padding: EdgeInsets.only(bottom: 15),
            child: Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              logWelcomeOr("Or Sign in With us", 15),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton.mini(
                buttonType: ButtonType.google,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
                          child: HomePage()));
                },
              ),
              SignInButton.mini(
                buttonType: ButtonType.apple,
                btnColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
                          child: HomePage()));
                },
              ),
              SignInButton.mini(
                buttonType: ButtonType.twitter,
                btnColor: Colors.blue[450],
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: Duration(milliseconds: 500),
                          child: HomePage()));
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
