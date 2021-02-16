import 'package:flutter/material.dart';
import 'package:plenty/screens/Fashion/FashionCategoryPage.dart';
import 'package:plenty/screens/Food/FoodCategoryPage.dart';
import 'package:plenty/screens/Food/FoodItemPage.dart';
import 'package:plenty/screens/Food/FoodStorePage.dart';
import 'package:plenty/screens/Home/HomePage.dart';
import 'package:plenty/screens/Home/RewardCard.dart';
import 'package:plenty/screens/Home/SignInPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plenty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInPage(),
    );
  }
}
