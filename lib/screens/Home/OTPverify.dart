import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:plenty/config/size_config.dart';
import 'package:plenty/screens/Home/HomePage.dart';

class OTPverify extends StatefulWidget {
  @override
  _OTPverifyState createState() => _OTPverifyState();
}

class _OTPverifyState extends State<OTPverify> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          appBarr(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  //  color: AppColors.sadagreen,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icons/P.png',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text("Please enter OTP sent to  +* *** *** ***"),
              //  buildTimer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) {
                                nextField(value, pin2FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              focusNode: pin2FocusNode,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) =>
                                  nextField(value, pin3FocusNode),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              focusNode: pin3FocusNode,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) =>
                                  nextField(value, pin4FocusNode),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              focusNode: pin4FocusNode,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: otpInputDecoration,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  pin4FocusNode.unfocus();
                                  // Then you need to check is the code is correct or not
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      //  SizedBox(height: SizeConfig.screenHeight * 0.15),
                      /*   DefaultButton(
                  text: "Continue",
                  press: () {},
                ) */
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Didnt Receive a Code? '),
                  InkWell(
                    onTap: () {
                      // OTP code resend
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        "Resend OTP".toUpperCase(),
                        style: TextStyle(
                            color: AppColors.plentyblue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: plentyFlatBtn5(
                  'LOGIN',
                  () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 500),
                            child: HomePage()));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: AppColors.plentyblue),
          ),
        ),
      ],
    );
  }

  Widget appBarr() {
    return Stack(
      children: [
        Icon(
          CupertinoIcons.chevron_back,
          color: AppColors.black,
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            //  color: AppColors.sadagreen,
            image: DecorationImage(
              image: AssetImage(
                'assets/image/Store Banner.jpg',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}

final otpInputDecoration = InputDecoration(
  filled: true,
  fillColor: AppColors.txtfields,
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColors.txtfields),
  );
}
