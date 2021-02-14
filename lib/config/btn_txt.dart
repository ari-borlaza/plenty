import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';

const inputFieldTextStyle = TextStyle(fontWeight: FontWeight.w500);

const inputFieldHintTextStyle = TextStyle(color: Color(0xff444444));

const inputFieldPasswordTextStyle =
    TextStyle(fontWeight: FontWeight.w500, letterSpacing: 3);

const inputFieldHintPaswordTextStyle =
    TextStyle(color: Color(0xff444444), letterSpacing: 2);

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: AppColors.plentyblue));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(5)));

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
      cursorColor: AppColors.plentyblue,
      style: inputFieldTextStyle,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        hintText: hintText,
        hintStyle: GoogleFonts.oswald(fontSize: 15),
        focusedBorder: inputFieldFocusedBorderStyle,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: inputFieldDefaultBorderStyle,
      ),
    ),
  );
}

Container plentyPasswordInput(String hintText,
    {onTap, onChanged, onEditingComplete, onSubmitted}) {
  return Container(
    width: 300,
    margin: EdgeInsets.only(top: 10),
    child: TextField(
      onTap: onTap,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      obscureText: true,
      cursorColor: AppColors.plentyblue,
      style: inputFieldHintPaswordTextStyle,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          /*    filled: true,
          fillColor: AppColors.txtfields, */
          hintText: hintText,
          hintStyle: GoogleFonts.oswald(fontSize: 15),
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: inputFieldDefaultBorderStyle),
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
