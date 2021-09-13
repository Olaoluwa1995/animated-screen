import 'package:flutter/material.dart';

class Room {
  final int id;
  final String title;
  final String subTitle;
  final String image;
  final String routeName;

  Room({
    required this.id,
    required this.title,
    required this.image,
    required this.routeName,
    required this.subTitle,
  });
}

class Rooms {
  static List<Room> rooms = [
    Room(
      id: 1,
      title: 'Bed room',
      image: 'assets/bed.svg',
      routeName: "",
      subTitle: "4 Lights",
    ),
    Room(
      id: 2,
      title: 'Living room',
      image: 'assets/room.svg',
      routeName: "",
      subTitle: "2 Lights",
    ),
    Room(
      id: 3,
      title: 'Kitchen',
      image: 'assets/kitchen.svg',
      routeName: "",
      subTitle: "5 Lights",
    ),
    Room(
      id: 4,
      title: 'Bathroom',
      image: 'assets/bathtube.svg',
      routeName: "",
      subTitle: "1 Light",
    ),
    Room(
      id: 5,
      title: 'Outdoor',
      image: 'assets/house.svg',
      routeName: "",
      subTitle: "5 Lights",
    ),
    Room(
      id: 6,
      title: 'Balcony',
      image: 'assets/balcony.svg',
      routeName: "",
      subTitle: "2 Lights",
    ), 
  ];
}