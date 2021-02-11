import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plenty/config/colors.dart';

Text logWelcome(String txt, double a) {
  return Text(
    txt,
    style: GoogleFonts.oswald(
        fontSize: a, fontWeight: FontWeight.w700, color: AppColors.black),
  );
}

Text logWelcomeOr(String txt, double a) {
  return Text(
    txt,
    style: GoogleFonts.oswald(fontSize: a, color: AppColors.black),
  );
}

Widget logWelcome1(String txt1, double a) {
  return TypewriterAnimatedTextKit(
    onTap: () {
      print("Tap Event");
    },
    text: [txt1],
    textStyle: GoogleFonts.oswald(fontSize: a, color: AppColors.plentyblue),
    textAlign: TextAlign.start,
    pause: Duration(seconds: 30),
  );
}

Widget homeWelcome1(String txt1, double a) {
  return TypewriterAnimatedTextKit(
    onTap: () {
      print("Tap Event");
    },
    text: [txt1],
    textStyle: GoogleFonts.oswald(fontSize: a, color: AppColors.white),
    textAlign: TextAlign.start,
    pause: Duration(milliseconds: 30000),
  );
}

Text homeChoose(String txt, double a) {
  return Text(
    txt,
    style: GoogleFonts.ebGaramond(
        fontSize: a, fontWeight: FontWeight.w700, color: AppColors.plentyblue),
  );
}

Widget homeChoose1(String txt1, double a) {
  return TypewriterAnimatedTextKit(
    onTap: () {
      print("Tap Event");
    },
    text: [txt1],
    textStyle: GoogleFonts.ebGaramond(
      fontSize: a,
      color: AppColors.plentyblue,
      fontWeight: FontWeight.w700,
    ),
    textAlign: TextAlign.start,
    pause: Duration(milliseconds: 15000),
  );
}

Text appBartxt(String txt, double a) {
  return Text(
    txt,
    style: GoogleFonts.oswald(fontSize: a, color: AppColors.white),
  );
}

Widget homeWelcome2(String txt1, double a) {
  return TyperAnimatedTextKit(
    onTap: () {
      print("Tap Event");
    },
    text: [txt1],
    textStyle: GoogleFonts.oswald(fontSize: a, color: AppColors.black),
    textAlign: TextAlign.start,
    pause: Duration(seconds: 30),
  );
}

Text itemTxt(String txt, double a) {
  return Text(
    txt,
    style: GoogleFonts.raleway(fontSize: a, color: AppColors.white),
  );
}
