import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula_2/constans.dart';
import 'package:sub_flutter_pemula_2/screens/detail/components/body.dart';
import 'components/bottom_sheet_description.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key key,
    this.image,
    this.city,
    this.name,
    this.rating,
    this.description
  }) : super(key: key);

  final String image;
  final String city;
  final String name;
  final double rating;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        image: image,
        city: city,
        name: name,
        rating: rating,
        description: description,
      )
    );
  }
}