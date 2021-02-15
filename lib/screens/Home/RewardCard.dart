import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/screens/Home/HomePage.dart';
import 'package:sign_button/sign_button.dart';

class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  // translate and customize captions
  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
          const Color(0xFF26325E),
          const Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final cardDecoration = BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          'https://image.freepik.com/free-vector/luxury-ornamental-mandala-islamic-background-with-golden-arabesque-patterns_177363-506.jpg',
        ),
        fit: BoxFit.fitWidth,
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
      ],
      gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.blue,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      borderRadius: BorderRadius.all(Radius.circular(15)));

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

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
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

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
                                      child: HomePage()));
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
                  ],
                ),
              ),
              SizedBox(height: 10),
              homeChoose('My Rewards Card', 15),
              SizedBox(height: 5),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: Stack(children: [
                  CreditCardInputForm(
                    showResetButton: true,
                    onStateChange: (currentState, cardInfo) {
                      print(currentState);
                      print(cardInfo);
                    },
                    // customCaptions: customCaptions,
                    // cardCVV: '222',
                    // cardName: 'Jeongtae Kim',
                    // cardNumber: '1111111111111111',
                    // cardValid: '12/12',
                    // intialCardState: InputState.DONE,
                    frontCardDecoration: cardDecoration,
                    backCardDecoration: cardDecoration,
                    prevButtonDecoration: buttonStyle,
                    nextButtonDecoration: buttonStyle,
                    //prevButtonStyle: buttonStyle,
                    //nextButtonStyle: buttonStyle,
                    prevButtonTextStyle: buttonTextStyle,
                    nextButtonTextStyle: buttonTextStyle,
                    // resetButtonTextStyle: buttonTextStyle,
                  ),
                ]),
              ),
              SizedBox(height: 5),
              homeChoose('My Profile', 15),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                height: 250,
                decoration: BoxDecoration(color: AppColors.white),
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.grey,
                        thickness: 0.8,
                        height: 0,
                      );
                    },
                    //   scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    //  itemExtent: 25.0,
                    itemCount: list1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 1000),
                                  child: links1[index]));
                          /* 
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => links1[index])); */
                        },
                        leading: icons1[index],
                        title: Text(
                          list1[index],
                          style: GoogleFonts.markaziText(
                              color: AppColors.black, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        trailing: Icon(
                          CupertinoIcons.right_chevron,
                          size: 20,
                          color: AppColors.black,
                        ),
                      );
                    }),
              ),
              Column(
                children: [
                  homeChoose('Find us in Social Media', 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton.mini(
                        buttonType: ButtonType.facebook,
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
                        btnColor: Colors.blue,
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
                    ],
                  ),
                  homeChoose('www.plentyofthings.com', 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}