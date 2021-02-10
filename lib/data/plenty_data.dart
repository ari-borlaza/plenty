import 'package:flutter/material.dart';
import 'package:plenty/config/imglist.dart';

class PlentyData {
  List<PlentyModel> plentyList;

  PlentyData() {
    plentyList = List();
    plentyList.add(
      PlentyModel(
          id: 0,
          category: 'Fine Dining',
          rating: 5.6,
          genre: ["Family", "Adventure"],
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis convallis tellus id interdum velit. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel.",
          image: Image.asset("assets/image/food.jpeg"),
          imageText: Image.asset("assets/image/food1.jpeg"),
          videoClipPath: "assets/videos/food.mp4",
          videoClipReflectionPath: "assets/videos/food.mp4",
          castList: [
            PlentyCastModel(
              name: "Robert Downey Jr",
              photo: Image.asset("assets/image/cast/robert.jpg"),
            ),
            PlentyCastModel(
              name: "Tom Holland",
              photo: Image.asset("assets/image/cast/tom.jpg"),
            ),
            PlentyCastModel(
              name: "Rami Malek",
              photo: Image.asset("assets/image/cast/rami.jpg"),
            ),
            PlentyCastModel(
              name: "Selena Gomez",
              photo: Image.asset("assets/image/cast/selena.jpg"),
            )
          ]),
    );
    plentyList.add(
      PlentyModel(
          id: 1,
          category: 'Fashion',
          rating: 4.0,
          genre: ["Action", "Adventure"],
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis convallis tellus id interdum velit. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel.",
          image: Image.asset("assets/image/fashion.jpeg"),
          imageText: Image.asset("assets/image/fashion1.jpeg"),
          videoClipPath: "assets/videos/fashion.mp4",
          videoClipReflectionPath: "assets/videos/fashion.mp4",
          castList: [
            PlentyCastModel(
              name: "Liu Yifei",
              photo: Image.asset("assets/image/cast/liu.jpg"),
            ),
            PlentyCastModel(
              name: "Donnie Yen",
              photo: Image.asset("assets/image/cast/donnie.jpg"),
            ),
            PlentyCastModel(
              name: "Jet Li",
              photo: Image.asset("assets/image/cast/jetli.jpg"),
            ),
            PlentyCastModel(
              name: "Gong Li",
              photo: Image.asset("assets/image/cast/gongli.jpg"),
            )
          ]),
    );
    plentyList.add(
      PlentyModel(
          id: 2,
          category: 'Salon',
          rating: 7.0,
          genre: ["Action", "Adventure"],
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis convallis tellus id interdum velit. Ipsum a arcu cursus vitae congue mauris rhoncus aenean vel.",
          image: Image.asset("assets/image/salon.jpeg"),
          imageText: Image.asset("assets/image/salon1.jpeg"),
          videoClipPath: "assets/videos/salon.mp4",
          videoClipReflectionPath: "assets/videos/salon.mp4",
          castList: [
            PlentyCastModel(
              name: "Scarlett Johansson",
              photo: Image.asset("assets/image/cast/scarlett.jpg"),
            ),
            PlentyCastModel(
              name: "Florance Pugh",
              photo: Image.asset("assets/image/cast/florance.jpg"),
            ),
            PlentyCastModel(
              name: "David Harbour",
              photo: Image.asset("assets/image/cast/david.jpg"),
            ),
            PlentyCastModel(
              name: "Rachel Weisz",
              photo: Image.asset("assets/image/cast/rachel.jpg"),
            )
          ]),
    );
  }
}

class PlentyModel {
  int id;
  String name;
  String category;
  List<String> genre;
  double rating;
  String description;
  Image image;
  Image imageText;
  String videoClipPath;
  String videoClipReflectionPath;
  List<PlentyCastModel> castList = List();

  PlentyModel(
      {this.id,
      this.genre,
      this.name,
      this.category,
      this.rating,
      this.description,
      this.image,
      this.imageText,
      this.castList,
      this.videoClipPath,
      this.videoClipReflectionPath});
}

class PlentyCastModel {
  String name;
  Image photo;

  PlentyCastModel({this.name, this.photo});
}
