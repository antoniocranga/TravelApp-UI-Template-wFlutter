import 'package:flutter/material.dart';

Color darkblue = new Color(0xff183243);
Color grey = new Color(0xffA4A9Ac);

class Activities {
  final String photo;
  final String location;
  final String name;

  Activities({this.photo, this.location, this.name});
}

class Featured extends Activities {
  Featured(String photo, String location, String name)
      : super(location: location, name: name, photo: photo);
}

class Recommended extends Activities {
  Recommended(String photo, String location, String name)
      : super(location: location, name: name, photo: photo);
}

List<Featured> featured = [
  Featured("assets/bali.jpg", "Bali", "Exotic Bali Resort"),
  Featured("assets/phuket.jpg", "Thailand", "Phuket Island"),
];
List<Recommended> recommended = [
  Recommended("assets/santorini.jpg", "Greece", "Santorini"),
  Recommended("assets/komodo.jpg", "Komodo", "Komodo"),
];
