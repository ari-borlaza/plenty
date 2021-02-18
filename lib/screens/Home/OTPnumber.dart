import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plenty/config/btn_txt.dart';
import 'package:plenty/config/colors.dart';
import 'package:plenty/config/textstyles.dart';
import 'package:plenty/screens/Home/AccountDetails.dart';
import 'package:plenty/screens/Home/HomePage.dart';
import 'package:plenty/screens/Home/OTPverify.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flip_card/flip_card.dart';

class OTPnumber extends StatefulWidget {
  @override
  _OTPnumberState createState() => _OTPnumberState();
}

class _OTPnumberState extends State<OTPnumber> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      homeWelcome2('Welcome to Plenty!', 30),
                      Text("Please enter your mobile number to login"),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: IntlPhoneField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
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
                    /* 
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    //border: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.txtfields),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    filled: true,
                    fillColor: AppColors.txtfields,
                    //       labelText: 'Phone Number', */
                  ),
                  initialCountryCode: 'SA',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: plentyFlatBtn5('Send OTP', () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 500),
                          child: OTPverify()));
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appBarr() {
    return Container(
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
    );
  }
}
