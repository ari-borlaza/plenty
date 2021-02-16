import 'package:flutter/material.dart';
import 'package:plenty/screens/Fashion/FashionCategoryPage.dart';
import 'package:plenty/screens/Food/FoodCategoryPage.dart';

class PlentyData {
  List<PlentyModel> plentyList;

  PlentyData() {
    plentyList = List();
    plentyList.add(
      PlentyModel(
        id: 0,
        category: 'Fine Dining',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis convallis tellus id interdum velit. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel.",
        image: Image.asset("assets/image/dine.png"),
        image1: Image.asset('assets/image/dinetab_6sec.gif'),
        link: FoodCategoryPage(),
      ),
    );
    plentyList.add(
      PlentyModel(
        id: 1,
        category: 'Fashion',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis convallis tellus id interdum velit. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel.",
        image: Image.asset("assets/image/fashion.png"),
        image1: Image.asset('assets/image/fashiontab_6sec.gif'),
        link: FashionCategoryPage(),
      ),
    );
    plentyList.add(
      PlentyModel(
        id: 2,
        category: 'Beauty',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis convallis tellus id interdum velit. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel.",
        image: Image.asset("assets/image/beauty.png"),
        image1: Image.asset('assets/image/beautytab_6sec.gif'),
        link: FashionCategoryPage(),
      ),
    );
  }
}

class PlentyModel {
  int id;
  String restoname;
  String category;
  List<String> genre;
  double rating;
  String description;
  Image image;
  Image imageText;
  String videoClipPath;
  String videoClipReflectionPath;
  List<PlentyRestModel> restList = List();
  List<PlentyItemModel> itemList = List();
  dynamic link;
  Image image1;

  PlentyModel({
    this.id,
    this.genre,
    this.restoname,
    this.category,
    this.rating,
    this.description,
    this.image,
    this.imageText,
    this.restList,
    this.videoClipPath,
    this.videoClipReflectionPath,
    this.itemList,
    this.link,
    this.image1,
  });
}

class PlentyRestModel {
  String restoname;
  Image photo;

  PlentyRestModel({this.restoname, this.photo, List<PlentyItemModel> itemList});
}

class PlentyItemModel {
  String itemname;
  Image photo;

  PlentyItemModel({this.itemname, this.photo});
}
