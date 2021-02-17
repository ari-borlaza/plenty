import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';

const inputFieldTextStyle =
    TextStyle(fontWeight: FontWeight.w500, letterSpacing: 2);

const inputFieldHintTextStyle =
    TextStyle(color: Color(0xff444444), letterSpacing: 3);

const inputFieldPasswordTextStyle =
    TextStyle(fontWeight: FontWeight.w500, letterSpacing: 2);

const inputFieldHintPaswordTextStyle = TextStyle(
  color: Color(0xff444444),
  letterSpacing: 2,
);

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: Colors.transparent));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    borderSide: BorderSide.none,
    gapPadding: 0,
    borderRadius: BorderRadius.all(Radius.circular(5)));

FlatButton plentyFlatBtn(String text, onPressed) {
  return FlatButton(
    onPressed: onPressed,
    child: Text(text, style: GoogleFonts.cabin(fontSize: 15)),
    textColor: AppColors.white,
    color: AppColors.plentyblue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashColor: AppColors.txtfields,
  );
}

FlatButton plentyFlatBtn3(String text, onPressed) {
  return FlatButton.icon(
    icon: Icon(Icons.wallet_giftcard),
    minWidth: double.infinity,
    onPressed: onPressed,
    label: Text(text, style: GoogleFonts.cabin(fontSize: 15)),
    textColor: AppColors.white,
    color: AppColors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashColor: AppColors.txtfields,
  );
}

FlatButton plentyFlatBtn4(String text, onPressed) {
  return FlatButton(
    minWidth: double.infinity,
    onPressed: onPressed,
    child: Text(text, style: GoogleFonts.cabin(fontSize: 15)),
    textColor: AppColors.white,
    color: AppColors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashColor: AppColors.txtfields,
  );
}

FlatButton plentyFlatBtn1(String text, onPressed) {
  return FlatButton.icon(
    icon: Icon(CupertinoIcons.chevron_left),
    onPressed: onPressed,
    label: Text(text, style: GoogleFonts.cabin(fontSize: 15)),
    textColor: AppColors.white,
    color: AppColors.greyss,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashColor: AppColors.txtfields,
    minWidth: 300,
  );
}

FlatButton plentyFlatBtn2(String text, onPressed) {
  return FlatButton(
    height: 20,
    padding: EdgeInsets.all(0),
    onPressed: onPressed,
    child: Text(text, style: GoogleFonts.cabin(fontSize: 10)),
    textColor: AppColors.white,
    color: AppColors.sadagreen,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    splashColor: AppColors.txtfields,
  );
}

OutlineButton plentyOutlineBtn(String text, onPressed) {
  return OutlineButton(
    onPressed: onPressed,
    child: Text(text),
    textColor: AppColors.plentyblue,
    highlightedBorderColor: AppColors.txtfields,
    borderSide: BorderSide(color: AppColors.plentyblue),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashColor: AppColors.txtfieldss,
  );
}

Container plentyTextInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return Container(
    width: 300,
    child: TextField(
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      // cursorColor: AppColors.plentyblue,
      style: inputFieldTextStyle,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.txtfields,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/icons/User02.png',
              width: 10,
              height: 10,
              fit: BoxFit.fill,
              color: AppColors.plentyblue,
            ),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.oswald(fontSize: 13),
          //focusedBorder: inputFieldFocusedBorderStyle,
          //contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              // gapPadding: 6,
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    ),
  );
}

Container plentyPasswordInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return Container(
    width: 300,
    // height: 200,
    margin: EdgeInsets.only(top: 5),

    child: TextField(
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      obscureText: true,
      //cursorColor: AppColors.plentyblue,
      style: inputFieldHintPaswordTextStyle,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/icons/Lock.png',
              width: 10,
              height: 10,
              fit: BoxFit.fill,
              color: AppColors.plentyblue,
            ),
          ),
          filled: true,
          fillColor: AppColors.txtfields,
          hintText: hintText,
          hintStyle: GoogleFonts.oswald(fontSize: 13),
          //disabledBorder: inputFieldFocusedBorderStyle,
          //focusedBorder: inputFieldFocusedBorderStyle,
          // contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //  border: inputFieldFocusedBorderStyle
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              //       gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    ),
  );
}

FlatButton addToBasket(onPressed) {
  return FlatButton.icon(
    onPressed: onPressed,
    icon: Icon(Icons.shopping_basket_outlined),
    label: Text("Add to Basket", style: GoogleFonts.cabin(fontSize: 15)),
    textColor: AppColors.plentyblue,
    color: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashColor: AppColors.plentyblue,
  );
}
